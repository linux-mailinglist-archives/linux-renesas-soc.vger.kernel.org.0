Return-Path: <linux-renesas-soc+bounces-25491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4EC9B6EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 13:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C6494E25CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 12:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF2C31280A;
	Tue,  2 Dec 2025 12:09:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86079307AF0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764677378; cv=none; b=cCn48/FiK4r13yxg8ydCwr5Bt31Oa+H85P/8tT1JvvrNS2XwLpK4pq/hyAH76Fou2xE8NwgwV8hbjzQysmXGpjAPveGtj4/o887o/EJjpKxzKBbihs37ZPL+T1XjcCheKsdfEvC4BOBVBscSvVH+DaoPcda+y8u5OD1A1epcAEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764677378; c=relaxed/simple;
	bh=kTLfrKsgf2VXB24t8cRJN9SJ7mriqLwqaikvwd5++9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7Chsvp3s+A8Eg2K+jaWEO7NglIwxOKO1B3rqduM90PsV+ARza0mlCDe7L/0D7q+qYRsiRgmCErwD8yaeKlTEWeZCePQaby1JRDpUjQedpzrcFcaglJHgpBIzGDsBWkMcNEdNXbfsMZGlUnjcjvmf9+gO3G7oGsIHQTgvLrBXP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso4685509137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Dec 2025 04:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764677375; x=1765282175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypAWJy3jAJeMRPLcY/8LUpRt9rCzCCQ9Q49DC5oNPE4=;
        b=Hm3n7fLeYllv/VyyNfAO4K1RrH/kJ0U865wSDJ3XLYU/8ISevDRQkM3i/EJ3WaYcTp
         ROr5uZS3lotiTsAWBtHVp75vjcNKMrkJTrVIAtLzNM8iXnlyiuGut+HnIrR6cq6fXMW1
         Sykwm+KoPeCvtvO0rawfVX2Qp1YZpOBgHQ+iZfdu+xoAxd9XNl1Fr0ZTsQca1C0LoqU1
         2kD1nA4EmY1gkw5llKGO5BK8CM0C9F3PO2jIGVwEkmw4f4+7nPG73aQJ/OW7jJkDR6rx
         t254nAfAnJP+fqVpJ53Vu+HL2SZZ3UTXwQsPAX4+sPGVnO9Nmp6cS3LG2lYw0XQTrloS
         zC1A==
X-Forwarded-Encrypted: i=1; AJvYcCU3WGRMzClTdsUW5EsFdZVfhpRf4ojkkfFmFf5LTGUHKVQxhelmI+aN7hdLEXfh75PCtQWQVn0fMgDbuG0b6j5hwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCvyus9sXcENk4/RlgQSIhvw8jEtASQgTcd1PHiPWOQP7GVfUw
	qJ1pyuN/+LSsv7ea7luJEyPV+lOTKmX9Zh63VcfXqoS3WK1YmS29HtVvph/F6G+1
X-Gm-Gg: ASbGnctxseU6YvdG2Cj+DObeuTmXDqHIKHI7NN+vIrG2ez82JmuY5r6jy/EZgn4eWJP
	RnM6KIIbNdd+2kOp5mxhbySNGu6qmnhfufHCLA0BNJCv2ILopldpoVicDrVG5Y1rBWVr0z0gHtT
	c0uT9rMada5POuM+0dC1W9X/HEX/yY5UqoWB6t61vZwsZ2L6705OqXSjrIPN98T0hQIoZV4MpJ0
	wQbpcRkmy33B6wDevvpARsd2fG6ge+6fam5uXJYwQfFyzIh9Cs6hSe3xZOp0ycVD9LLzwa+rhag
	CuNzT/z/78+9YGU2qeLIu9LsShwL4y4nR0hA4aSpNer5A+vEqaS7X6Gnz7aMp04T1bFRRMpwmbY
	TCEai5DpTIvQXldWnY+02aTnqjulQtSUBjCDWtKpsvHZK/D9zyhfhGUe9n9Lyv0QAFzMSMbhpSq
	sgF5FPOXWg26wj/ekqd8B24Ok+oJIjESpiwe2xJ9m+lfo39B7W9P1Efot56L4=
X-Google-Smtp-Source: AGHT+IE3Djl4E8+XvAc+AiancPeu5GZlML9thsKBjetyAe8ZB3fh5bkgkPtMr8d/rLzycHwE7k8iNA==
X-Received: by 2002:a05:6102:5a94:b0:5df:bd66:7b76 with SMTP id ada2fe7eead31-5e22426a628mr12041255137.17.1764677375235;
        Tue, 02 Dec 2025 04:09:35 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd69da72csm7115440241.0.2025.12.02.04.09.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 04:09:34 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso4685474137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Dec 2025 04:09:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaKb7oV1kFY2SMA99hrE/K4RM7Y+IhEgf4NJOLimfwSPfU9Blg86d3sOz3hDT9EC6b4595ubnokYfkW95xjb1TFA==@vger.kernel.org
X-Received: by 2002:a05:6102:26ce:b0:5db:cc69:7399 with SMTP id
 ada2fe7eead31-5e22420aeccmr12778651137.5.1764677373450; Tue, 02 Dec 2025
 04:09:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202070927.14198-1-dev@null.aaront.org>
In-Reply-To: <20251202070927.14198-1-dev@null.aaront.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 13:09:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjZH_Vw8n9je0f8eCZKUxd39kyuj61uWsq1MgLcNdy=g@mail.gmail.com>
X-Gm-Features: AWmQ_bl41DkHmCngqU9lUvrcW8M41BJUUqOY1u8aQwc47fxgrL-hz-iXO2PwIVY
Message-ID: <CAMuHMdUjZH_Vw8n9je0f8eCZKUxd39kyuj61uWsq1MgLcNdy=g@mail.gmail.com>
Subject: Re: [PATCH] debugfs: Fix default access mode config check
To: Aaron Thompson <dev@aaront.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Aaron,

Thanks for your patch!

On Tue, 2 Dec 2025 at 08:19, Aaron Thompson <dev@aaront.org> wrote:
> This typo caused debugfs to always behave as if
> CONFIG_DEBUG_FS_ALLOW_NONE was selected.
>
> Fixes: f278809475f6 ("debugfs: Remove broken no-mount mode")
> Reported-by: Mark Brown <broonie@kernel.org>

Please run scripts/checkpatch.pl on your patches.
For this patch, it reports:

    WARNING: Reported-by: should be immediately followed by Closes:
with a URL to the report

Closes: https://lore.kernel.org/8c2a2753-145e-4de5-84fe-9a900af6a2ee@sirena.org.uk

For the broken patch, it would have reported:

    WARNING: IS_ENABLED(DEBUG_FS_ALLOW_ALL) is normally used as
IS_ENABLED(CONFIG_DEBUG_FS_ALLOW_ALL)

> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Aaron Thompson <dev@aaront.org>

Thank you, this fixes:

    1. "pinctrl core: failed to create debugfs directory for <foo>.pinctrl",
    2. Failed to mount debugfs,
    3. Systemd dropping in emergency mode on Debian systems.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -35,7 +35,7 @@
>  static struct vfsmount *debugfs_mount;
>  static int debugfs_mount_count;
>  static bool debugfs_registered;
> -static bool debugfs_enabled __ro_after_init = IS_ENABLED(DEBUG_FS_ALLOW_ALL);
> +static bool debugfs_enabled __ro_after_init = IS_ENABLED(CONFIG_DEBUG_FS_ALLOW_ALL);
>
>  /*
>   * Don't allow access attributes to be changed whilst the kernel is locked down

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

