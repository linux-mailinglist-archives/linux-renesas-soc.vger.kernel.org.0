Return-Path: <linux-renesas-soc+bounces-24424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AEDC481C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 17:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D068188FC98
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 16:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6575232F757;
	Mon, 10 Nov 2025 16:40:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313632F749
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792848; cv=none; b=FiwkrLCJrP9nVpkHidFaj2miHSOECCUYPm33gz4YLhqiorQB6HWlUUHgg/oGaMQbF8eXC592g0wxJzeHKjtdWTxaxgJyghEZ54zatyWcBMTNEvEGLnsfBXtwUskFcE+lXE33KUFQstMdq0Cdv6DnDiHFAvqgHSsv6zxvkiGjmro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792848; c=relaxed/simple;
	bh=vGMbit6ddUlwoxrUxi6IwHq4K44T3JViUun4qtrQOtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BMqndjds+8biJ/RBvH4p4te9FMk6DZdDBsGxnSMAxvqWXz/sMMjutvItA/hufgYudveJbg+kq/jl+wXGyCT755FoZ5mR82VRlmPqCUV+Eenmzme+0GIXZQmjZR+x3cCNm7YVDBo8WHwxY4VFzy9PJn6JpEQW0qt1ZXf3FwlxTd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-93e2c9821fcso34002639f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792846; x=1763397646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHzMucwowrWDP2Qt+Y+UWKgurmYAh4juIylWzobpf/s=;
        b=YcEz7p1S7RFwtmpzQUs56VbT4qF68rkv+Ov4NgyaC7h3ZQD/2QBIeDjLRsJdZ3Nxc4
         EtdL2hrHT5IPE78sMPDyKHCjNVUpO3AP/ORP+U4Bvkhln8s9ii9KRwC5FLsrlERCr6zU
         4dqAT2DvPShyFKWXfO7uOSd9QGZ+5V7IURtjiB5ykpjgq+sfywlo+QQpaf0FthiWCb8Y
         uks/5AB5W5GcNS7+XaKA3eBs76Zg+UnxRlsuXLgt1IYs0Rw3ANjBNy9wsfkXQ1LBnLVh
         K/30lbPvu8cjdSGirkWDWHTydVjeSCtkwP9HEQ5fzFJUgPApRT1cyELfbwgygihHEEol
         8ajw==
X-Forwarded-Encrypted: i=1; AJvYcCWjsS1z9cpndmhQW1YAxgZArxSjTjXHSuSV0MLql9JqxdGBeudPthroOeoc0AHiBJ7Sauu7ZpcRrk0GzYRXtEH6Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymq7jYDCJ0AcstiLFdjwLOUlhtVqQguANwEyPaetjIkVRQO9iR
	pM2mhHw4UdLtzKIgMkfzRKgMhPGFj3ZSJefkJSYxEyS7wVea0ZDAvBDsWvv4nxGk
X-Gm-Gg: ASbGncsykEfCGz5i93bvf70UjmT0pSlRPGVUpmBSO6nzXl/1BY/IwAJOh0IO57oy0Y8
	XkKyDeNNbV5OTSi9EoUJ6zTU6gyVDEBOOUTmHQjdEBVzLIGtQAiQLVfBovqCMDSL+m5C0BkhOG1
	V6anXsdGoB48OcPUJO8mu/L3dpo0+NDUc9l2SEl1OU9gOJaz5ii3HlD9KMrIfiAQrjrwG6ae4fR
	wTnVi8BCjwY5b8zOLslworR3gGAvjiiHG590QMOKQz/AFCBkj1NIOJJprDkmYRxQwuVhOg2AU/E
	CTbYcRyGacmylC7Fto39RiHcEhgbt6gBwsoQq8Ym3IUAcwjBte8bbvsc5FQEzHJp6OS9GSP9+Ct
	NG0pJHCmo0j6rd9nnnQOaZE4tdA5Vx4Ca8j8419f4xb4xbanosvLFdVL4idma2JzXcZqUYSbFy4
	Fd9Tn8ApTDA+6Z36gdrOCfLIOjUyEtVF8wUZ1fwgpVVQI2D0+AnVv4
X-Google-Smtp-Source: AGHT+IEUDLTAgckZgCcyFueQ9LXzemxPMQx70NOKvsrjIz9bL93/+qEt6qGc3DRclzEqfZdeWsd/Qg==
X-Received: by 2002:a05:6602:6a98:b0:892:6e7e:c59c with SMTP id ca18e2360f4ac-94896033140mr1334216239f.19.1762792845743;
        Mon, 10 Nov 2025 08:40:45 -0800 (PST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94888b4dac7sm413867839f.8.2025.11.10.08.40.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 08:40:45 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-4331d3eea61so25754775ab.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:40:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUulA0QCkFujzfUu/EoCqZut8xsh81Py1+jNZyITBLN5SKJ39rMZ6Wp6nS1HuLO/lS6kWTO/UxEMiJD0MYh1HV6g==@vger.kernel.org
X-Received: by 2002:a05:6102:c8e:b0:519:534a:6c5e with SMTP id
 ada2fe7eead31-5ddd57eb0b0mr1693520137.33.1762792372340; Mon, 10 Nov 2025
 08:32:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103141834.71677-1-herve.codina@bootlin.com> <20251103141834.71677-4-herve.codina@bootlin.com>
In-Reply-To: <20251103141834.71677-4-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 17:32:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFOQANqnBX7nNST+WRxYz2j3gznohEZXF1SC-GyjDuGw@mail.gmail.com>
X-Gm-Features: AWmQ_bl9D3O0uVkd9QcrhvhsjRnIq7PDvVWO1-VB9dJdhU03nrwxJGeIcNitAIk
Message-ID: <CAMuHMdWFOQANqnBX7nNST+WRxYz2j3gznohEZXF1SC-GyjDuGw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: renesas: r9a06g032: Add the ADC device
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Nov 2025 at 15:19, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> The ADC available in the r9a06g032 SoC can use up to two internal ADC
> cores (ADC1 and ADC2) those internal cores are handled through ADC
> controller virtual channels.
>
> Describe this device.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

