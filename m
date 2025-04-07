Return-Path: <linux-renesas-soc+bounces-15447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA6AA7DE8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 15:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 962583A9A10
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 13:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB50253353;
	Mon,  7 Apr 2025 13:10:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46224A04;
	Mon,  7 Apr 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031401; cv=none; b=T6iU0y2FzwyM4qGa7tXpOD/lu1MjhrCHlj29zitmPFRREXsGzJecbSRmYpt7DzeFLCvnzG8w5FZMUzS3h3cRgm3ZdV/6jfm9gtkp7xregbPIRpCsNyNJBZx9Y5LanRB/IATDfJ194h8cVh5e1HgTT19Um6grar3S47MElp+Jepw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031401; c=relaxed/simple;
	bh=9MC8INLcpsg0XXiU5MvT3qHFLKectbQWdkzXQ2sDKZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVhY7Iz0xGNRA4Zf0Z3m6lboQMeleiiZqBLAi7BhXwP65m1X9siVxQPcuZ8SMvsMijlXSLBRXBr/QDoVWQuWipidQPohyj5DMXy63JzO2/9JSb0JCr+7xZs2BNGm9mmXXXx8KPZ2A2G9aYiXxXRY17YAPwTu0DCzNdHP17eWAIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so1794792241.1;
        Mon, 07 Apr 2025 06:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031397; x=1744636197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMbt/iLjQgXAqzYY3Q4wO5RPHa7TGoR9HHOAkNd8J4I=;
        b=SEa1MpvHjQ/FTcuWiq6iKhEk9eLc7yswrnd2V7NxHjN6riuk4kLanPr3KvOKW5z9L/
         PqBq8Vtb9lOTcHGoScPxpyDZM7Jsl0rmlINB7Le7LzbYZlVPeQwR43ooBcfPMBRwlg5m
         IFASpMpU2JvW6cHLLqvBUiy6/mEvDVmDO7nb/rrOXJCagkmWBF+REer32YJp3zJLLBBT
         odhL0PmUtRDi/ynJGUYTRrloil2eg+V/1nzE87vvmk3O8hfDamt3GZ5XbNxfUgwX9CSh
         tQA2ArGeTEUQXSftFpWTnFspwWoZjbXEYWJg8IprtloFwwqULW6ynCxKaM6EmIhnWXqN
         QP3w==
X-Forwarded-Encrypted: i=1; AJvYcCU+h7hrKFxAFWiNRCYFZtBKFsItW4eeUbbWYKjQC7X5qzL74LCLA+YAoVEEpu3xUY302TWUK/e1AvwzoDayy+ngG3Y=@vger.kernel.org, AJvYcCVK3Q0j0B8a+attqOw4I/d31pYqWQp/RlAGacv9UcBsLRlx8Bp6pyX5DcAFCWVA6VykHKBAlaTP1fHkPQE=@vger.kernel.org, AJvYcCWxtds4OqyhQAjiaTB52aCsuUh3t3K8tmJL12I9rr2WwndKP3/ya/Rx51opnd/0/TxQpcFvYs33/EtXSBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTCr6rdk9OAqZb7uBbMP4SV8xzfVCwGFDPPn7tsxHF9iPjF+ij
	o1h3ACoJihXwVIdV5fea+uyIXnHYPjD31b0v5vImEV2wbF+DgZLqCMBDiB18
X-Gm-Gg: ASbGncvRcs1znuI2/P7Pb6J3NPWQRHjjV07l0rMqTUH5Z6e4lWGR9gCLr+PWhtmTYGn
	R5HHDjRmRa5FbauA84ZF4AUa16/MaZ90TGaqU/+dcAyTG19eq/ZpisQau8d+WgxYCINX28mGXOO
	UYVDltuk9ihgFR+J51xPFnl4MoNFBn8hWYeoGjZme0kd6ppqR5C8kU5AE5PKsTbpPpV6Q7FqElZ
	awvCBQwP+W29XsDCo5BdV3C3zbjt4YvadTgeZJNHLWDhanMpFQu4QL/0Fm/uRNqcNLJjz4yDUxy
	Aeb8z4qyZfQ0xogHRl0CcLYp+Gj9QyzbHzBWNX67Xq6e8l5NDE/N2Zwyh+2iOi0SVnll6s+n8ya
	JnUDdszA=
X-Google-Smtp-Source: AGHT+IGOD5dmsQ8m21gwcytd5EDiwEi/MRy59TrjZo5ewTnhrPnXxN4LDlLWEzDzJ9v6HGzPsg6MwA==
X-Received: by 2002:a05:6102:334d:b0:4c3:6393:83f4 with SMTP id ada2fe7eead31-4c856889f09mr8839975137.2.1744031397316;
        Mon, 07 Apr 2025 06:09:57 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8738b28b561sm1718557241.23.2025.04.07.06.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:09:57 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86feb848764so1783246241.0;
        Mon, 07 Apr 2025 06:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfc9+wu8uYzXb7+PprHVIwQ6DAGR717mxKz6gf8Z9Dd46hvCFE0eW69FjH2+7eJyrg6aKIXk9GO6P+LxLOE497Lzg=@vger.kernel.org, AJvYcCXCFYEgDup4/bWxWEOsMjlEgYkYVCoLRuWse8tmTSrkKaB/5kPScn0XSKEpjRZm9Vr0V4oqy+l2MTkwlFk=@vger.kernel.org, AJvYcCXUyvAy63If8kMUWNvyG3UJj8Gs8DGYpQ6DGvmTVvLIHz9OYj2cOxnFBPuGazrc2UctixzyKtPhz8PG6SY=@vger.kernel.org
X-Received: by 2002:a05:6102:2c8c:b0:4c1:9159:859c with SMTP id
 ada2fe7eead31-4c856907033mr8729050137.15.1744031396980; Mon, 07 Apr 2025
 06:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124-alsa-hdmi-codec-eld-v1-0-bad045cfaeac@linaro.org> <20250124-alsa-hdmi-codec-eld-v1-2-bad045cfaeac@linaro.org>
In-Reply-To: <20250124-alsa-hdmi-codec-eld-v1-2-bad045cfaeac@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Apr 2025 15:09:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjc1rE54KZ39XmVbjvGa4rYeaSjAMgMQfs6gFKpRbhZg@mail.gmail.com>
X-Gm-Features: ATxdqUGyXl6MbUhtXCef-j2gYLh_XFf9jBcdhmDTWPqF69APCxPPQvz1cfXCg4M
Message-ID: <CAMuHMdWjc1rE54KZ39XmVbjvGa4rYeaSjAMgMQfs6gFKpRbhZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: hdmi-codec: dump ELD through procfs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Fri, 24 Jan 2025 at 22:14, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> Use freshly added API and add eld#n files to procfs for the ASoC cards
> utilizing HDMI codec. This simplifies debugging of the possible ASoC /
> HDMI / DisplayPort audio issues.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for your patch, which is now commit 0ecd24a6d8b251eb ("ASoC:
hdmi-codec: dump ELD through procfs") in v6.15-rc1.

This causes the following failure on Salvator-XS:

    ------------[ cut here ]------------
    proc_dir_entry 'card0/eld#0' already registered
    WARNING: CPU: 3 PID: 93 at fs/proc/generic.c:377 proc_register+0x12c/0x1b8
    CPU: 3 UID: 0 PID: 93 Comm: kworker/u33:5 Not tainted
6.14.0-rc1-arm64-renesas-00004-g0ecd24a6d8b2 #2923
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
    Workqueue: events_unbound deferred_probe_work_func
    pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : proc_register+0x12c/0x1b8
    lr : proc_register+0x12c/0x1b8
    sp : ffff800081ac38d0
    x29: ffff800081ac38d0 x28: ffff0004c2f7b398 x27: ffff8000813fca80
    x26: ffff0004c2f3b8c0 x25: ffff8000814b3660 x24: ffff0004c2f3b840
    x23: 0000000000000005 x22: ffff0004c2ce7b2c x21: 0000000000000005
    x20: ffff0004c2ce7a80 x19: ffff0004c2ce7a48 x18: 0000000000000006
    x17: 0000000000000000 x16: 0000000000000068 x15: 0769076707650772
    x14: 0720077907640761 x13: ffff800081380a30 x12: 00000000000005ca
    x11: 00000000000001ee x10: ffff8000813d8a30 x9 : ffff800081380a30
    x8 : 00000000ffffefff x7 : ffff8000813d8a30 x6 : 80000000fffff000
    x5 : 00000000000001ef x4 : 0000000000000000 x3 : 0000000000000000
    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0004c0870000
    Call trace:
     proc_register+0x12c/0x1b8 (P)
     proc_create_data+0x3c/0x60
     snd_info_register+0xcc/0x12c
     snd_info_register+0x30/0x12c
     snd_info_card_register+0x1c/0x94
     snd_card_register+0x1a4/0x1e4
     snd_soc_bind_card+0x7dc/0xab4
     snd_soc_register_card+0xec/0x100
     devm_snd_soc_register_card+0x48/0x98
     audio_graph_parse_of+0x1c4/0x1f8
     graph_probe+0x6c/0x80
     platform_probe+0x64/0xbc
     really_probe+0xb8/0x294
     __driver_probe_device+0x74/0x124
     driver_probe_device+0xd4/0x158
     __device_attach_driver+0xd4/0x154
     bus_for_each_drv+0x84/0xe0
     __device_attach+0x9c/0x188
     device_initial_probe+0x10/0x18
     bus_probe_device+0xa0/0xa4
     deferred_probe_work_func+0x80/0xb4
     process_one_work+0x144/0x280
     worker_thread+0x2c4/0x3cc
     kthread+0x128/0x1e0
     ret_from_fork+0x10/0x20
    ---[ end trace 0000000000000000 ]---
    asoc-audio-graph-card sound: ASoC: failed to register soundcard -12
    asoc-audio-graph-card sound: probe with driver
asoc-audio-graph-card failed with error -12

And:

     ALSA device list:
    -  #0: rcar-sound
    +  No soundcards found.

So the card it tried to register is the first one?

Reverting the commit fixes the issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

