Return-Path: <linux-renesas-soc+bounces-28510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADDwKp9RoWkfsAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 09:11:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57F1B4479
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 09:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0158A303EA8E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 08:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576DD342C98;
	Fri, 27 Feb 2026 08:10:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD82A331A73
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179829; cv=none; b=iVFLt3LBSHtsOs6sgQbSPNto/idB8WHb3V3Iwi4AnGGeERz/f+pTaVaVOnrso2ZVw0p0UWI/rYKEoKI6p3v5yt9XVUdz2Wxwc1om9vUZBLtRcJe7gsPqFu8Mcs/gFNXim17QgPP4USi9iydNPxnEc/zIh+3/QkSYZg0ybPP6QBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179829; c=relaxed/simple;
	bh=qY+6vtZIBaPo7p2rQb5HkfRHikNgbNgH9ir3jbhfxXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDKuTH9Wk3eV0j0SVDEhuGUjUYQCsZMnMEDoDgnTe+jzsH75HEpGwnTUdruwAWqtWEcmn4/D89P+gOTZYjA6Redp7EpX+qG3Vs/ZNiFcnlpsSRoh0TwFeiD7tRUD3al7qQ5zSDYpa1tdxaI/HuSN7x7HqFOtw6bppOp+L+xZGRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ff10630b75so1155078137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 00:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179827; x=1772784627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS+Nq6fE9ANsMccogrQUTDz/b1EfY+/VnApqIp7Qs5A=;
        b=XBF6Qm27pCNKhIxwPkfmVrqbvrw4vEhKzexBkfb2tpeUzv0r3nM5ERBTsITqJR0uyZ
         TC8BlAx2zHEKTukfSmaN2+HhxKzgFtZ2WRFyhVxygVAnmETOXkHxqZvXiYCrrW8I3DYz
         tm2Ic5pfCDRQ4Ex9sd2qLgyHHcCOG/7mIME2exiYrSXgBUvA5Q1CKMnus3kPoE94qrO1
         FOHAENtF8DfxMd/+LnlcOfUk7QAQgI6rlBw4mZllUBlfJkj/Whsb5r9hErqV/3IwkFZh
         RIWHHVmoZk1gZNYLCfqF2u0I8pqUPx2tgzcrRfvL2rDDrpgk5UpOIodjSh92OVQjZKKV
         35Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXWp8emcFMHJp9d8Rt1QlpzEwtjQvexTgNoliMDZUupdKnjaR7eeiOPPuadVCeG6g0iiNOZJ45Qp9NWdiIjMlnpjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIiR5ZtQVF2+4I57EH/jYeyZGxwIgoGK0wgy1WdKRNTexBfmw
	NmO+olAPBRLOl9Qw+FgqebVn2lq+U96UYU2Lp6+4LURqUWGRVMUx/DmrCFz5dvn5l00=
X-Gm-Gg: ATEYQzwVMt3DzbIvZcV5bcqychSj2EHInzHSy+TycmuT8XBb0r+D7hIgrOwRsERacrK
	DulYWSogdq/v4vusFnftUYb7NNnyz2fzFszJDgTWuj0feJBxS6gPiDLv0xQPaw3vZMdqNpJvdIQ
	He/PcQqjWh1Wp/r+PIiMB74h6upOLuwAMy2v6kUClP89kQ6MjpN9hrDJEromM9e/3SmGaQfVGuv
	BV4dydXYzNKTImFFN4XDFFgjVrfYVw7jyz+DWek4jmdrrCR1/FH+2L+EWzUMq5OrGqNrKFmPSBF
	cnUZyZEW3PIgulEFaOYS8bv1mFzfLjdwbXHQF7aSoYWh0bqcXbSY0nH80yEqzc+JtZxYcKmpJMl
	6aFXffQvV0AKDwiy3+QhfGXAE/v+VAkw9CyHVXGurHAeDjqUMvsAmEs05YZs9jGuqYmldB2BdNb
	rL83xyakkVd15BX6sP+gvguODjGeOomVAMuYd7QDgnYXYpv0MpajzN5zCQQNQv
X-Received: by 2002:a05:6102:3706:b0:5f5:2b1c:7551 with SMTP id ada2fe7eead31-5ff324b0b85mr1194932137.19.1772179826672;
        Fri, 27 Feb 2026 00:10:26 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7aeb8dsm4645300137.2.2026.02.27.00.10.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:10:26 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dd06a96easo1267728241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 00:10:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4bg7hkBpHWBLlFV7nD7zMeJBfqc0M18Qfjvnr5W5FKX0azJrLc5VrYbxHqAq1TAS2NIKUO4e7tZTI1afowdTLqg==@vger.kernel.org
X-Received: by 2002:a05:6102:3f0b:b0:5f5:256d:c0cd with SMTP id
 ada2fe7eead31-5ff3252a602mr1351611137.34.1772179825969; Fri, 27 Feb 2026
 00:10:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com> <c353fdef-9ccd-4a11-a527-ab4a792d8e70@sirena.org.uk>
In-Reply-To: <c353fdef-9ccd-4a11-a527-ab4a792d8e70@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:10:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5aNzuK2a05y+hPsQubc5EEL4-HWuogwPk4PKJZUm9kQ@mail.gmail.com>
X-Gm-Features: AaiRm51dht9shWvn_cyhMi2zpTdQ1R6tDUZPQSQmlY_CJ2Avf6OMEpTOhy9cyhA
Message-ID: <CAMuHMdU5aNzuK2a05y+hPsQubc5EEL4-HWuogwPk4PKJZUm9kQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
To: Mark Brown <broonie@kernel.org>
Cc: Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28510-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0E57F1B4479
X-Rspamd-Action: no action

Hi Mark,

On Thu, 26 Feb 2026 at 18:24, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jan 23, 2026 at 02:44:50PM +0000, Matt Coster wrote:
> > This helper handles the attaching and linking of the entire list of power
> > domains. Besides making pvr_power_domains_init() simpler, this also lays
> > the groundwork to simplify supporting the varied power domain names used in
> > Volcanic GPU cores.
>
> I'm seeing oopses in -next on at least k3-am625-verdin-wifi-mallow which
> bisect to this patch.  We get:
>
> [   10.820056] powervr fd00000.gpu: Direct firmware load for powervr/rogue_33.15.11.3_v1.fw failed with error -2
> [   10.831903] powervr fd00000.gpu: [drm] *ERROR* failed to load firmware powervr/rogue_33.15.11.3_v1.fw (err=-2)
> ...
> [   10.844023] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
> ...
> [   11.090162] Call trace:
> [   11.092600]  pvr_power_domains_fini+0x18/0xa0 [powervr] (P)
> [   11.098218]  pvr_probe+0x100/0x14c [powervr]
> [   11.102505]  platform_probe+0x5c/0xa4
>
> which does seem relevant to the changed code.
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/2499326#L865
>
> bisect log (with links to additional runtime logs):

> # first bad commit: [e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d] drm/imagination: Use dev_pm_domain_attach_list()

Thanks for your report!

I can confirm this crash on e.g. R-Car H3 ES2.0 (after adding a
GPU node).  Actually I had seen it earlier this week, but didn't pay
enough attention.  Hence  I just assumed it was the known race condition
when removing multiple PM Domains, and thus missed it is a new bug.

The issue is that pvr_power->domains is a NULL pointer, thus causing
a crash when dereferencing that pointer:

    int i = (int)pvr_power->domains->num_pds - 1;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

