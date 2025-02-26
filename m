Return-Path: <linux-renesas-soc+bounces-13688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFB7A45169
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 01:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82DC219C0724
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 00:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40F156B81;
	Wed, 26 Feb 2025 00:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ajQVyawQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A31E40C03
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Feb 2025 00:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740529608; cv=none; b=FNjDM1QrmGqRfDAZu/pNjUYZNKAwQVlghsZ8QwcMeKwiCQTo8pOFamb62LI3ZrMwXzZU514jO48S154bfyafLwumC81xUPe0xjpiulaHMp2cu2AH3uvhgWEgZOanUjBq47zpMCrnuwf5GKtfDBfwC9F915NvUnYePzUgat4sg/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740529608; c=relaxed/simple;
	bh=U8EoAqRFMwNN0vkZxxuJ747c1TkFoXybVwKQXTpYFNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mv/zZiPcfhLC+fnuRhwCIYI4t9LmMYexe9dSfmI7ycCsSGPH7D2RQ3jwGw051lxxs5vdborTJLN29651yO5laD8waGUWUIiFvV7vMzNaxQrzzL7cYPD81VkH9yAatKCMNtk3atafVv1+vwwEN/4vYysGckXwbPDCqh6wSJkgKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ajQVyawQ; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f408052bdcso2194441b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2025 16:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740529604; x=1741134404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TtkdEm0DhE9kMHrzm4v1hwSlsrJYtgXqAtJA7aT6OdM=;
        b=ajQVyawQVJadBMDPUptySchMkqqVEJx1NM6ucacylDf+Nd6HU7JEw+KpIn8LQoCL1n
         Q9TC7gKbBXw/M3iiMMvV3g40ZQUkZlOMGgVcZTC/N+WVl/XK+yE1oVZyWVfixvNEUobc
         6csOi93pB71E1HL3ULzFP8prHxcNAa1BKh2ZBbG466jRvyBvC5i7Fe0LkjefqVFUfSp5
         d5W5E1u0Z72z1byg9+8GU5ukPeS2Exz2uVc3hu4fz5hMhi8auubwcGBYFnDRQl0Mh4cJ
         e/mSCeT+PCQjOk2P3vQFF0aw2jptNtKYfdyVVs/xPE5ScKmkiZXQK7qdeafAWiJ1MEOD
         k/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740529604; x=1741134404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TtkdEm0DhE9kMHrzm4v1hwSlsrJYtgXqAtJA7aT6OdM=;
        b=n9lHritYCxYOonLrxGg272iNSQZeRLph0AoYNjPgvvfMjLKSW2K3SreNO5wfGOHCcp
         mT3EtTXTMlu4KbQfAgZkCjeBfEtKjiuIufulXQTVxPcbTcYxS7CnzoA5rxObK9YXV5mO
         ltvHv5irIPcq/vhZE/O4OHpRQJ+JWdTPzRmxCnFMoaqaPPljq3K7V0/lXJRda0ENsKlx
         +WI9k3jiiV5c/phb+FsdKuXVdhLu2noPrCRB1E0Nw8qhtw7nqS5a6R9y5eROu2B9OOfF
         W57MHN4W20tmX0nGOf48hZWUX9krchgVGqCDGYu0ICxwLc7PnaFnRhEZhUOysqeG0cWn
         vidA==
X-Forwarded-Encrypted: i=1; AJvYcCUkpSNqTD788M7EkM3yXYQIhKwyqYQ0wwp3xU8UV0lm8/OVfhdFo0/pCOxQFOpjSMgpgmHIcJ3cWdYAHhlIsIx5SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJodneCBYI+ePnE4eDtkTLkdHJnuORKutYrJxQJdX18AR1SOKn
	MvaOLulSk7cs0gDRWm5UsI97mgcO+lXUGWIVZG9BNZMbhHGnnibPn8TVvXc9nSs=
X-Gm-Gg: ASbGncs43k1iAp78//bmie/OA6JnqCs8oIwpaIUPaPm5OwH0ekUH/cT6yQoxGm85dyB
	zHUssiPDEc0xa0WFZacvFIp3cpupB4IOnWvkKqLy8kYjm2jvcm1uBJjdTnaP0zX6H8nyc/E3VYJ
	1uUQhlW1kI0wFID2CBqGQJIJNM84CH1khaKN0dGJYbFH4IgfBmijOdEs7Hczs3TNLmQuf9GhDiz
	2FqsKZx67XNDGKEZd4MYjqqq2C2yQV9tTpdCe6BarkAXuwBnBHnKLleRIe9cScSngn3Z7g9heRs
	eRpI9FmFW3LjOChRS2c7ne+RM2ztXOMRGeGeLsVBBScSDOGn5andbYMJpfMMT9o=
X-Google-Smtp-Source: AGHT+IHrEzlhOgkq+zDuK43ZJTHn/TAq6eat4Ph04G840iIXAUXagf0yq5sPkcY8nyRgOxiDTjBreA==
X-Received: by 2002:aca:1a0e:0:b0:3f4:ad6:5190 with SMTP id 5614622812f47-3f547de878fmr763766b6e.2.1740529604637;
        Tue, 25 Feb 2025 16:26:44 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f541c5bce1sm510105b6e.46.2025.02.25.16.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 16:26:43 -0800 (PST)
Message-ID: <0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
Date: Tue, 25 Feb 2025 18:26:40 -0600
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/24/25 12:33 PM, Matti Vaittinen wrote:
> There are ADC ICs which may have some of the AIN pins usable for other
> functions. These ICs may have some of the AIN pins wired so that they
> should not be used for ADC.
> 
> (Preferred?) way for marking pins which can be used as ADC inputs is to
> add corresponding channels@N nodes in the device tree as described in
> the ADC binding yaml.

I think "preferred?" is the key question here. Currently, it is assumed
that basically all IIO bindings have channels implicitly even if the
binding doesn't call them out. It just means that there is nothing
special about the channel that needs to be documented, but the channel
is still there.

Similarly, on several drivers we added recently that make use of adc.yaml
(adi,ad7380, adi,ad4695) we wrote the bindings with the intention that
if a channel was wired in the default configuration, then you would just
omit the channel node for that input pin. Therefore, this helper couldn't
be used by these drivers since we always have a fixed number of channels
used in the driver regardless of if there are explicit channel nodes in
the devicetree or not.

In my experience, the only time we don't populate all available channels
on an ADC, even if not used, is in cases like differential chips where
any two inputs can be mixed and matched to form a channel. Some of these,
like adi,ad7173-8 would have 100s or 1000s of channels if we tried to
include all possible channels. In those cases, we make an exception and
use a dynamic number of channels based on the devicetree. But for chips
that have less than 20 total possible channels or so we've always
provided all possible channels to userspace. It makes writing userspace
software for a specific chip easier if we can always assume that chip
has the same number of channels.

> 
> Add couple of helper functions which can be used to retrieve the channel
> information from the device node.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 

