Return-Path: <linux-renesas-soc+bounces-34308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tv2uHGk5OWpzowcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:32:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B981B6AFE23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:32:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C28E5304C7EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 13:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928823B6359;
	Mon, 22 Jun 2026 13:30:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6713A9D9A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 13:30:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135046; cv=none; b=MHIY7W/oeYo1QuKjf+FEQGPov0uHp9nfYCR1JsZ1W69oQNqxVRETZ85crcooQs4NdLeJ0mKnLuI1f4AVn2pjvB7xlx6A3g/MKghSIy9e/5F0IGOM0eFUbfuDAiZ62L7Q48B+Sqndse3oPTRCV+rDK7Lz9dex7F919shwkw3kot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135046; c=relaxed/simple;
	bh=BgJ1ZxGlN3gL51u/jblEWZAtpcv/F6kI3bh+XoERS7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcxYaKQAgQcZ2enQ9omrnyth7m6DzToWQH9kN2CQ9/1bYop6PNtlRDp+DJXmjJMpaa0Y51zj+e6vKy1D/DWrVJmgKZJg+n2bjX0FBhhCF/iG5xuNEJYUFmR8e9KdLpdfwyMQw6IudRm4VKwVcqjcZIiTPTtqJY0wDbHBKarGkn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so7493442a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135038; x=1782739838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GuTM79i7YCtTZTiRjLyW48bgm8MVBHEx0azWn0cnMM=;
        b=eUkOsp2ng0KUz955x7cuDSlXudk/3zXzCvj00aty35l6NC6IZGu/NuCyTQUTf/UM6h
         SiiphU52Y8Z+VimK4N9EWYvxRBDTX/H+vo6PgnsatuGYtxDypNRhu/Wnf+LRPRgIMzMe
         E6njisbCfVnHoP9a/Wl5noPt7rJfdcQm1MZxb9aqiCX6evQWXw42bzNSluS7cpGziZNh
         PCBp1Bkgq9OYD+WC4LVB/CsALDQFru5k9r4IeYmFWvmnPVNR+LdvRa9FGgN0jCKQ5fyK
         v6gQszP7j8KlNnhPrNo69qv0wr948hcA2iBXZLsWvoeObj5mNQ2llC7NdOEgW+6BZlEL
         eiPg==
X-Forwarded-Encrypted: i=1; AFNElJ/HNY4zgWCqXqCChtakppMbLBnsRtg5GEALC5yVGrivPT2+2UXN2HPzeRYJnTi8q45bCryd9L+Sqq7SjolK7mmk0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdlTScopk782cnugeXUP45bJ3SrPbCcM+iDxKzXLTw9GiRi41l
	NRJBEUWo3z8/GlnDDbThYkLyL+AwQcoyMwdY5mM//DJiHey5GKTXSWrroT7RcE+Dz9c=
X-Gm-Gg: AfdE7clDyMXP7PyTWx3/GbHN/LFL/A0EwDJxw9QoWtgJk5jIUsjD+HRTmkgY8BBrNnH
	FtVR4/BpQAA5R0YtpwSyOebBRi4J8fkFTiS8e1au4nA7gfbUmQ3bsGAzfqL41Ev6b2m3lHj3VGs
	vSRsxsVHXeOa4WCRciJngtt5AK0RaF0VGlsDVCQTyGvBj6v83vydA1icwETpz6abUwVzv9RmNlK
	JtkFIz/d4d+IQdc1rYdKoDRApEbKFIalDG/nJcPLT9Sfmd/T9eZ/F6qWrBEsFUQsW+YvoyXGDou
	NNsQudoCbR1roKzdFor+hyCoWArS/p+mvSY8PqwuKoBcriDOEXI8QzMhO8+kpOfQwv7+HaNalRU
	vJ1IP59/bJb6J5jX+mkGWpNADqVfPgusFpb/kn+1Hjm/VfGVzFYyxydL57qZMiUU1m3wuB14bE7
	e9vlzLeaMnrdP4rWEzTuJbkA/A0b8avxSAwBAkHlf/bABvnjqY9g==
X-Received: by 2002:a05:6402:5017:b0:697:750e:e9f0 with SMTP id 4fb4d7f45d1cf-697750eefffmr4538046a12.14.1782135038156;
        Mon, 22 Jun 2026 06:30:38 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82fa67sm3527984a12.4.2026.06.22.06.30.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:30:37 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6977dc206afso3721001a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:30:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ93qyd0RJZmPSHwjHh6SI7LETZIzCkLY2JKAjNNUbnPDFEBVUTkNF2qP4uPxfehDsPXYwV5JwP8ni8hGrRFYwvcPA==@vger.kernel.org
X-Received: by 2002:a05:6402:3997:b0:697:8365:7e63 with SMTP id
 4fb4d7f45d1cf-69783658098mr3569202a12.7.1782135035601; Mon, 22 Jun 2026
 06:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com> <20260619083951.3777556-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260619083951.3777556-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:30:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVE+dXU0Y9-7HAKD=UVdupn=A9u-h_78t53jDfRzK+NwA@mail.gmail.com>
X-Gm-Features: AVVi8CdtJV4mV-ZNF2QvOQ3l_ngUyw6ocAvz7ylDmAMlp2cVch2OlkPJQViSt1Q
Message-ID: <CAMuHMdVE+dXU0Y9-7HAKD=UVdupn=A9u-h_78t53jDfRzK+NwA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34308-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,glider.be:email,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B981B6AFE23

On Fri, 19 Jun 2026 at 10:41, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
> sound input/output using SSI3/SSI4 where:
>
>  - The codec receives its master clock from the Versa3 clock
>    generator present on the SoM
>  - SSI4 shares clock pins with SSI3 to provide a separate data
>    line for full-duplex audio capture.
>
> Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v6: No changes.
> v5:
>  - Drop the unnecessary #address-cells / #size-cells from the
>    codec@1a node; the port child has no unit address or reg, and the
>    da7212 binding sets unevaluatedProperties: false.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

