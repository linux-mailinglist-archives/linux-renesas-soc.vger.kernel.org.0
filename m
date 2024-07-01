Return-Path: <linux-renesas-soc+bounces-6929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9418891DAB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 10:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BD7D2858CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 08:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2436412C491;
	Mon,  1 Jul 2024 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2QOLny48"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AE212D1FF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jul 2024 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719824083; cv=none; b=Z4JN1FveSAUk4AtV7qOzxPNizf/B9PhwU+3stbqV3GIybfSxMaSBaH/jLcoG9XhbAFlubHuA5JaJ75xKjt0R/QjfMVqcTb3jYXnPrruXYBPCUELkzB9hA/qpXXfGqKTj8AoOe8oqjIbONpVwHaDftDufxiS+4lcfg4h2oq4haDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719824083; c=relaxed/simple;
	bh=r0qZrtxSrp94FXSfPxju8ybAs8t+CAZoLq166dR+hP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nmDVGkt6ndc+W1Pqe23bbvLC65KrUUwuHWuloF9A5Se0Q6VxbPfSNQ2/YAtzzULVws7MJpZtprRXCDLmstUajyieyDyDCF/4tQvuQYQwM0Kf0R1/HjEim8+Z2AWMDTxrSfiDpOUcXYkGd3KUeD59WCKkNSgQIfYz3taNFuDw5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2QOLny48; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-36703b0f914so1631463f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Jul 2024 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719824079; x=1720428879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7PYE4fR5mHYdhnN6/gjsaLL3PDggXsWQnnwmWozp1U=;
        b=2QOLny48L32/JtQuNj5F4k6wu5WIJDSzP7nyn1pu78wn4vfp38nikl6PYeIj9jy46e
         eM0Dz7L+OcIWlmYyy1vXlPxodLfL4smWdG5CdOGVhZXoaeqgE57vX87sNDbLNF7ke2NZ
         6IfupzxoBajMPfLJcKNYy47H1JUBCdVO7RubZLR+k96VyS7ZYfaEKDHY76r9JmN1zWOe
         u94bVddIhY7PgnR7PL0o8PaTiMAdXV5phi+GB0ifriPYjQQW9C3BzvUz2jEgFyG2UoNx
         sapS2thaVYBx/a5xyLp61+tYfO7srMyu6GqB4Hl5fnB1/gvXuOnwQ62CX/OBZeS4gyaE
         I3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824079; x=1720428879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7PYE4fR5mHYdhnN6/gjsaLL3PDggXsWQnnwmWozp1U=;
        b=vf75o4BZp/HOWM2Pe2IWt2W8wewQBg/u3DSADrtwbftqEMEkJbhZaLYSe5XKeTNqNO
         F4ZY6RQLTw2pCtupDlRUZaS3PMZtWmTu2pKnBX2RTXe0xNtf8KygHbdwv8C+QXCGKg/q
         GiWJ+8rBaH4LRllLy2Idpv085KeUejcRvOeThVediTmDKVRbCcobgdkDxydvxX0uIL6n
         ZoJ5eN0fwIJfshXzTOJ712+rcIcCtbbdnw02QgPEZvjnXBrgL2IV61uLM88K9cZt8q7X
         Xu9/wjRwlUjPqAC7sXTgvo7v+4D58QbBYdhl9pn1m+EXqZ6oBskpuH19KQj4K54CBQzu
         Hacg==
X-Gm-Message-State: AOJu0YwwPO8j0sbQsOd1QlYHRxq0TP36eSW4RCj7O5ir8a0ilg6RiY9L
	JkR1t1wxSOqhDfjea/n6Pi9LHyz7CSJZkU2qQFt8FMKzGLZjMwz4lKyT/YRy1h9tpIVcqkrVnzC
	g
X-Google-Smtp-Source: AGHT+IGa1wF8TP+oCBu6+VQx/YOP72EWk9wpmg6zSpP6/dtCHSuNQs4iuGhYWxcyhosvHjS3WEAEcQ==
X-Received: by 2002:a05:6000:154e:b0:367:42ce:f004 with SMTP id ffacd0b85a97d-36760aa2ec0mr8279760f8f.23.1719824079645;
        Mon, 01 Jul 2024 01:54:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1c2d:13b2:676b:59c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af376f5sm144045935e9.6.2024.07.01.01.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 01:54:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/1] gpio: add simple logic analyzer using polling
Date: Mon,  1 Jul 2024 10:54:37 +0200
Message-ID: <171982407462.12671.10169460529375303678.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620094159.6785-1-wsa+renesas@sang-engineering.com>
References: <20240620094159.6785-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 20 Jun 2024 11:41:57 +0200, Wolfram Sang wrote:
> Changes since v9:
> * add comment why late_initcall is used
> * use .remove_new instead of .remove
> * add needed includes
> * use devm for allocating mutex
> * remove stray ',' in compatible-array
> * remove success message in probe()
> 
> [...]

Applied, thanks!

[1/1] gpio: add sloppy logic analyzer using polling
      commit: 7828b7bbbf2074dd7dd14d87f50bc5ce9036d692

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

