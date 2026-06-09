Return-Path: <linux-renesas-soc+bounces-33740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1RYxBh3zJ2qg6AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:03:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D03465F3D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:03:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62F79314B137
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 10:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72A53FADF8;
	Tue,  9 Jun 2026 10:54:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0353FADE5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 10:54:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002453; cv=none; b=dFLDGcLsgkL19YrSJYBhLtUVtbDXg3swloPkNvtfX0sOi9yzcjzVNM2AbHFqf58qWr+D590dHoLh/P3mkM2yUnHdCanxJpeVIkRiL1jWVFYKVnTPaYEWYyDLAou60M60x2WaZC6BVcRanSH//+DEM5gLvh6V+MrkY+I1jWbhGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002453; c=relaxed/simple;
	bh=hyxfqnMe5Ouf/EapDGIc9svZB0EABhylZgVnmg8WXeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+RWRQCPMwZrIRdG9YMRP3GwQZh7INmU9LAI3LsSgq687HKRJTz52fSrvBKBNyFHn3ZFZzvDJUT1S70L1bsh5hOvnjHrvzmM0q0V62oXY/0omxG/XlyBDmUxC2lCU/oDHRgUSDtEiLp0MVB1UGdrTzdhehtjTz2VvHQB1cEw7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so3793736e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 03:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002451; x=1781607251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rI/ZYzohNaVdjObivz2HUaUTbbz4NQJssGLJM9gQD3U=;
        b=YBud43/3vQGWAK6wD3KQmE4pjqKKP1rgUe1oEQrLIQ7aVapyX5FSO/PEf4QHiS+0nw
         FkckXrRri11Zeg2XF+tS15U2Qmyeya6Hiy3qbT2ay2PbDOS02zLxv1/69s0Ek8Dnndx/
         6lSgNhy4y8TpldpxoV4BSRKsrbCnPPuR8c6GbY3HrqH7zUXcHjW8F20V+UMt7xuaw7/K
         007Fb97KQ7PzTs+tMKhtihMpK0FucAmgvwu3tE1OkExGLtZ9Ln2ej1dCs0zJbZVLloVA
         nAVMJ/HzvYWxfc3U79k+/8+e8oU3pXNLJoyzMq3UFquAzgJbRWL71PmOaMx/R01qoDEp
         hVWg==
X-Forwarded-Encrypted: i=1; AFNElJ8cHjsbrguwFJYhc45t4vmnBg6+gZTNk17wt9USHsFBnF3huONZgUFdJ/TDFGCjuA5WKSmlIWZAfOy+14Le2xo1yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVbc1/DJVSzAAIu9uoL/4qhSm9/U5ZIJMiyvgXo/+q0qFp3EGf
	rca4fJ1jpeX1sbPiPu9cIIHfyvTF7oOp1OmUIxdZRTH0bA0+Jp2yl26XqR0SKStGPmg=
X-Gm-Gg: Acq92OE1LNqv/8FdGE2T+niQ+0DSIkamNt9tLz0H+iJb/ydAb/rPYPH0o0JTG+vhnqm
	j4RkfaIFILkCI5vfJgAXYgNFAL14QcE6CUGyDmmIlSgkq9QoR6r0naJgwnewPjBlAWLTGG+ucGr
	Yxoh8Gxj8JsAJGpkw8d2/zpeON8LW/XZw2Z43fAseM8aIA4riK7nSFFu9w/Binpk1ehalGOtM5l
	JgsuwwfloE3GMRG8ys0Ee2qhlUmF5OU44QI4XwgNL68uNyRWtrIkWYpyaTeyEOEGaU+JSkT4JAa
	GqYvbUBkX6dz7QzGJhNGtIMxxuiMOjQ+OFOQA72ujLQVbXWvSgQfsPbUZpKdkCRzO85p8oJPzU6
	NKOSG7vNjc1VInYUIHrsMiQw8H9kIH85bgiRC76X4pkwKiGzRSwVuJsCl6U89zBN4rfzTedDD3+
	wQy8CbtJqqf0XIPRBAza3+i4iRbLyOdpSyvO1qcMgoulbMCSJ9WAi/4jHbz4RDE1kpE7NC8/g=
X-Received: by 2002:a05:6102:6899:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-6feed1ac3ebmr10502722137.1.1781002451041;
        Tue, 09 Jun 2026 03:54:11 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb5764dda8sm16628141137.5.2026.06.09.03.54.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:54:10 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6cfb0a137c9so3365098137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 03:54:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+45ZXEPgQUg8Mb5fvziruTVATQD0z8alQZQpNbOnDnb6Al97XSbI6dvdwnbJGRVOLl4A9Y5i6QRsj39TSVO5JicA==@vger.kernel.org
X-Received: by 2002:a05:6102:548c:b0:639:1e8b:ecd9 with SMTP id
 ada2fe7eead31-6fefa23308cmr9810049137.20.1781002449956; Tue, 09 Jun 2026
 03:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424104050.2617041-1-johan@kernel.org>
In-Reply-To: <20260424104050.2617041-1-johan@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 12:53:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHabMGJyJ7e7yp7DLC+JJc9k6NK9p4anj2wRKNuwZUng@mail.gmail.com>
X-Gm-Features: AVVi8CetX8T8pmOMrkxApWhVJ-6xKFmHvEBHTn3nlMEVF0vLCRTeJQ-YaR22GmU
Message-ID: <CAMuHMdUHabMGJyJ7e7yp7DLC+JJc9k6NK9p4anj2wRKNuwZUng@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: switch to dynamic root device
To: Johan Hovold <johan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33740-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:ulfh@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D03465F3D0

Hi Johan,

On Fri, 24 Apr 2026 at 12:41, Johan Hovold <johan@kernel.org> wrote:
> Driver core expects devices to be dynamically allocated and will, for
> example, complain loudly if a device that lacks a release function is
> ever freed.
>
> Use root_device_register() to allocate and register the root device
> instead of open coding using a static device.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Thanks for your patch, which is now commit a96e40f4afdcb52a
("pmdomain: core: switch to dynamic root device") in pmdomain/next.
On e.g. R-Car H1, R-Car M2-W, and R-Car H3, this causes scary messages
when systemd-journald.service is started:

    synth uevent: /always-on: failed to send uevent
    genpd_provider always-on: uevent: failed to send synthetic uevent: -22
    synth uevent: /ca15-cpu0: failed to send uevent
    genpd_provider ca15-cpu0: uevent: failed to send synthetic uevent: -22
    [...]

Reverting the commit fixes the issue.

> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -33,9 +33,7 @@ static const struct bus_type genpd_provider_bus_type = {
>  };
>
>  /* The parent for genpd_provider devices. */
> -static struct device genpd_provider_bus = {
> -       .init_name = "genpd_provider",
> -};
> +static struct device *genpd_provider_bus;
>
>  #define GENPD_RETRY_MAX_MS     250             /* Approximate */
>
> @@ -2325,7 +2323,7 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
>         device_initialize(&genpd->dev);
>         genpd->dev.release = genpd_provider_release;
>         genpd->dev.bus = &genpd_provider_bus_type;
> -       genpd->dev.parent = &genpd_provider_bus;
> +       genpd->dev.parent = genpd_provider_bus;
>
>         if (!genpd_is_dev_name_fw(genpd)) {
>                 dev_set_name(&genpd->dev, "%s", genpd->name);
> @@ -3567,11 +3565,9 @@ static int __init genpd_bus_init(void)
>  {
>         int ret;
>
> -       ret = device_register(&genpd_provider_bus);
> -       if (ret) {
> -               put_device(&genpd_provider_bus);
> -               return ret;
> -       }
> +       genpd_provider_bus = root_device_register("genpd_provider");
> +       if (IS_ERR(genpd_provider_bus))
> +               return PTR_ERR(genpd_provider_bus);
>
>         ret = bus_register(&genpd_provider_bus_type);
>         if (ret)
> @@ -3593,7 +3589,7 @@ static int __init genpd_bus_init(void)
>  err_prov_bus:
>         bus_unregister(&genpd_provider_bus_type);
>  err_dev:
> -       device_unregister(&genpd_provider_bus);
> +       root_device_unregister(genpd_provider_bus);
>         return ret;
>  }
>  core_initcall(genpd_bus_init);

Apparently this is done too late for drivers/pmdomain/renesas/rcar-sysc.c,
which registers PM domains from an early_initcall().  Doing all work in
rcar-sysc.c from the postcore_initcall() is not an option, as the
CPU power domains are needed for secondary CPU startup on R-Car H1.

Note that R-Car Gen4 is not affected, as it uses rcar-gen4-sysc.c
instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

