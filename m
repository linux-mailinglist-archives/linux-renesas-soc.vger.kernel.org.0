Return-Path: <linux-renesas-soc+bounces-17899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40471AD01F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 14:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ACD8172E23
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 12:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6EFE288C15;
	Fri,  6 Jun 2025 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fXgWHc8+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B03289E03
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Jun 2025 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211799; cv=none; b=iHO/SmHuLrSSWY2KpXR40CBsa4L5oSBWSFBoHDoJzIW0efK1qjaIsGY03TNvq8HQAki8dbHbT4TQX60qPfSISmN3CnZvq8GdxXQYZrD4QYgZJ5kYvB5Wgk/RifU19Z0HM9pt/rQkjjJ0AxfLnp1NdhloJRXpmaE96StrFuKBkdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211799; c=relaxed/simple;
	bh=k+TPf9LxMZ0D5A0zH/EF697ym/GMgEs15jvE9cO/4F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syddjIYZNj3Lfi2DBSSJ9gNdoV4OPm08Y5pZ4ZFRQQFsiSHLVUg0o7qBeifBETzKd7MNThYVtJfFGI8q3uCc7UQtsKrIbIRbfqGwMm7d5UHt1WoQvyVaENtBjcbp17aRgAwfwmkQl7jAfe4PZ6j//24tSil0tCbqRqiN6rsb4Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fXgWHc8+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ade33027bcfso17844566b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jun 2025 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749211795; x=1749816595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oseNslf9Y7EQEruK9NPY2cEIOzo1yyAZtDjzotnVGTM=;
        b=fXgWHc8+1wjmCVEr43bROJp3VVoPkVEEioQt8mDviPwrsFnparjji0o012NKtjnulf
         /Raxf3BlN74VEXb5wiPxxqxx+gtMXlFxbfAZZrEQ67AsFMBLLHMGZKlQWtDCMRjBV8E4
         T3dcPEA3qlRuCoDdbY9x68HCzTpqirc0De+dF0Js6Vio8Tqtz6awJpA5mhzjWaoflRO8
         p9DDJmPumaIx4+jTbpLIph7in8F4dRg1RB4+K4REk8TiP6e4yUbKuPQvWDjqyfrn5ttc
         +iTufdlnISscSXOUU2vjxZiEf/n3Bj6gVBPWF9rLYuJ0HWNg5y2JLsoNyE46Z2D5Ofo0
         liVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211795; x=1749816595;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oseNslf9Y7EQEruK9NPY2cEIOzo1yyAZtDjzotnVGTM=;
        b=aYDpf8A0livIpSWjxlmaddcVxghBpvKoNfzUQvKu3nsVLX5sVUyK3DXq68WSI4w2Pu
         gytdoMPNqfx1TZP28yP/VE71VHWKR9xzYCOW/apX5P3ZOZWF1nfm1FIskslWSpWZAbBs
         mXhmkXZT3flhMf0bWl7KIzZ1AU8A035zGrlDE1SOo7DbmxaXAZAvZZY/UeECrQXh6lqO
         bTjsj8nd+eq1c2Mj7HWf6jRk8Ud44ZGjtlSGGEwNG6+2WP2nhSP3fcp6bfXKEtBcLT28
         fr+ycBRxAwR1z+wEp6euAI+7FhM25VkXBp7FWkK0NQTgyfTarzaAsaJu4cvCWL9EJmdm
         OmNw==
X-Forwarded-Encrypted: i=1; AJvYcCVbBW636clA6pFMxfpVmOPoMbLTz695p7UIPrDJ6T0IKUAthxbLsWSTdwtNx2sFHLEpxxO/dtmniKwdjWByMt9pJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU4g7ibhONz0GXrJPXabTjjlVJYDsL4CCCowM84LRY/075gMbx
	frNuUJP8MttQHXWJF+cSUSC7jOEO4HbTpfZMVUvhgjxlbEUt1G9GTuuua6QSDEh7Des=
X-Gm-Gg: ASbGncu6+TdV+moOwOfmAUTo4WQqvHJLRvUvK+fos0b6L1XD/FvQpCVstcuqi3XxGP7
	0lveuyNQCCwhQXRqkRWFyU0m8U7So/fWsQYo9x6OEAZ3fe/IMVU0DGXWNOQUjlIgpXm9oQbFDDG
	bnrooHgYjOf78i2pUmL6EWZAwpVhlf40uBcTlemUZgWI9GXoc0twD7P1kwkASs6SOVHo39hNqfT
	7UZi/oZOuB8PZhmT/8DACYvkFJcljuPk9RUx+DiRwgd2CyPNLEBSFp7Dbl+qgOFKNNjZ3Em0wyy
	qzDSbV9M7L39nJLGUYisbDp3fCqpoUUvv4Cmhg3amKVmygvh41Qe1UyCyM25
X-Google-Smtp-Source: AGHT+IH3hNQ3m3x7yWyp9YoT5yQkAmNl6auoawMQKJM7FHzSoZ5r/4GUCilFu5xy1KEAYBRQ/sKeUw==
X-Received: by 2002:a17:906:4fca:b0:ad8:9a3b:b274 with SMTP id a640c23a62f3a-ade1aaff72bmr278171366b.52.1749211794857;
        Fri, 06 Jun 2025 05:09:54 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3837asm106811566b.126.2025.06.06.05.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 05:09:54 -0700 (PDT)
Message-ID: <9f4312cd-3d1d-44e8-9915-994dc712183b@tuxon.dev>
Date: Fri, 6 Jun 2025 15:09:53 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: renesas: rzg2l: Rename mstp_clock to mod_clock
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <53b3a730a784650762cdb27fdbde7a45b0c20db8.1749119264.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <53b3a730a784650762cdb27fdbde7a45b0c20db8.1749119264.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05.06.2025 13:28, Geert Uytterhoeven wrote:
> The mstp_clock structure really represents a module clock (cfr. the
> various rzg2l_mod_clock_*() functions and the to_mod_clock() helper),
> and is not directly related to the "Module stop state".
> Rename it to "mod_clock", and replace "mstp_clock" by "mod_clock".
> to avoid confusion with the mstop registers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


