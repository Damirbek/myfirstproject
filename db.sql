-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 07 2019 г., 00:24
-- Версия сервера: 5.6.43
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `views`, `image`, `body`, `published`, `created_at`, `update_at`) VALUES
(1, 1, '(???????? ??????)How a team of deep learning newbies came 3rd place in a kaggle contest', '(???????? ??????)How a team of deep learning newbies came 3rd place in a kaggle contest', 0, '1.jpg', 'The Women in Data Science in collaboration with their partners initiated the WiDS datathon. The challenge was to create a model that predicts the presence of oil palm plantations in satellite imagery. Planet and Figure Eight generously provided an annotated dataset of satellite images recently taken by Planet’s satellites. The dataset images are of 3-meter spatial resolution, and each is labeled based on the presence of an oil palm plantation in the image (0 for no plantation, 1 for the presence of a plantation). The task was to train a model that takes as input a satellite image and outputs a prediction of the likelihood of an image containing an oil palm plantation. Labeled training and test datasets were provided for model development by the competition creators. Read more here.', 1, '2019-05-05 21:48:17', '0000-00-00 00:00:00'),
(2, 1, 'Python’s One Liner graph creation library with animations Hans Rosling Style', 'Python’s One Liner graph creation library with animations Hans Rosling Style', 0, '5.jpg', ' distinctly remember the time when Seaborn came. I was really so fed up with Matplotlib. To create even simple graphs I had to run through so many StackOverflow threads.\r\n\r\nThe time I could have spent in thinking good ideas for presenting my data was being spent in handling Matplotlib. And it was frustrating.\r\n\r\nSeaborn is much better than Matplotlib, yet it also demands a lot of code for a simple “good looking” graph.\r\n\r\nWhen Plotly came it tried to solve that problem. And when added with Pandas, plotly is a great tool.\r\n\r\nJust using the iplot function, you can do so much with Plotly.\r\n\r\nBut still, it is not very intuitive. At least not for me.\r\n\r\nI still didn’t switch to Plotly just because I had spent enough time with Seaborn to do things “quickly” enough and I didn’t want to spend any more time learning a new visualization library. I had created my own functions in Seaborn to create the visualizations I most needed. Yet it was still a workaround. I had given up hope of having anything better.\r\n\r\nComes Plotly Express in the picture. And is it awesome?\r\n\r\nAccording to the creators of Plotly Express (who also created Plotly obviously), Plotly Express is to Plotly what Seaborn is to Matplotlib.', 0, '2019-05-05 16:40:11', '0000-00-00 00:00:00'),
(3, 1, 'Plotting business locations on maps using multiple Plotting libraries in Python', 'Aout AI', 0, '7.jpg', 'I was browsing through Kaggle and came across a dataset which included locations in latitudes and longitudes. I haven’t worked with plotting on maps so I decided to take this dataset and explore various options available to work through them. This is a basic guide about what I did and the inferences I drew about those libraries.\r\n\r\n    The aim was to look for a library that was very easy to use and worked seamlessly out of the box for plotting on maps. Another aim was to find a library that could print all the points in the dataset at once (190,000+ points).\r\n\r\nHere, I explored four libraries, gmplot, geopandas, plotly and bokeh. I’ll import the libraries as and when needed rather than importing them all in the beginning. The complete code is available as a GitHub repo:', 1, '2019-05-05 16:59:37', '0000-00-00 00:00:00'),
(4, 1, 'asldlkas;kd;lakdl', 'mcmcksdmcksdmckdsknvksldnvjevns', 0, '4.jpg', 'Dataset\r\n\r\nI took the dataset from Kaggle and saved it inside the data folder as dataset.csv. It includes a list of businesses complete with their address, state, location and more. I extracted the latitude, longitude, state, unique_states and name in separate arrays. I also extracted the minimum and maximum latitude and longitude values which would help me zoom into the specific area on a world map which we’ll see below.', 1, '2019-05-05 21:07:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `post_topic`
--

CREATE TABLE `post_topic` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post_topic`
--

INSERT INTO `post_topic` (`id`, `post_id`, `topic_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(2, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`id`, `name`, `slug`) VALUES
(3, 'Programming', 'About code'),
(2, 'Machine Learning', 'All about machine learning'),
(1, 'Data Sience', 'Everything about data sience');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('Author','Admin') DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `role`, `password`, `created_at`, `update_at`) VALUES
(1, 'Damir', 'jongolt1292@gmail.com', 'Admin', 'fabulous', '2019-05-05 09:52:58', '2019-05-05 09:52:58');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `post_topic`
--
ALTER TABLE `post_topic`
  ADD UNIQUE KEY `post_id` (`post_id`);

--
-- Индексы таблицы `topics`
--
ALTER TABLE `topics`
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `post_topic`
--
ALTER TABLE `post_topic`
  ADD CONSTRAINT `post_topic_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
