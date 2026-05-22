Return-Path: <linux-renesas-soc+bounces-33004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEA7IB1dEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:41:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE65B55CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 902F33056679
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253DB3BCD26;
	Fri, 22 May 2026 13:30:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72353C1414
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456646; cv=none; b=fXKuUKpQL7kOvtkJQLDf0IXXznXvPVwHD0u0SzVAk3mN+LBk5/hvHqL+hwGXd8EBSIbvTezQK4U3+1guhize/GbfHKdBgz073YQGXtiwop03bdixqXWuWuCHKqo1ena1Avx4J5EmtGkA4fBbODNaVB1HRP+jBvQPijIxJSThljY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456646; c=relaxed/simple;
	bh=ziuevw+51r4Kxjl+I3p78m/V9rg5BKYcFEZhcMCyNR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mq+WnWWNoimr/k81XZTFNV9+qSZsYu3JlgwXkKFKETCffXO+jlcdWyLXNPa5Yh5JXG5qMoRwlIZDBFqkGI9LYEjo0Q/6C0pG54hPSiWiNsLeFoS/FgFHFcI+mKDLiAsurUDOX/7TtlCA9hhNMb36lUiJPSGPYjAVeRT1yveHB8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-575124e716fso2448152e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456644; x=1780061444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai+ED0uxqMFK7sBAS5UAlxQfyL41wANubGy+GhyhNzw=;
        b=rbXMrU5rAuhR3sheS7VPcWw61aE8tXFY7M2USl9qvuALjFmw86Do745tgM8V/Oa5DP
         CVj2zBwm37Q3bzn3MiQ3wUSnkGmq1AJyxdWSyeGYoWuYJ9TLUim85GE4xOnoOcuQ36Ne
         VCCDlV3xBfMdo1MCh36MHLWck0wvtKE2CR2sASJju50A8/FNmG1BSBCahPiqG3fl7WN2
         eBFWwlTWc/vI/xA5QpaUinq2ylFoy5VtfqhHtPD+XES2oQWGHzlRrqm9OFXbwwVQHmnV
         ZOgFFEtX8fvbyuCOrWoa2KJ69i9gc2P0NEe0ElKls8S/BdjwSmTMgBov7OuXE+y73wNz
         4Ovg==
X-Forwarded-Encrypted: i=1; AFNElJ8CqJUvpNfUatbBu4TEus57q1cl71QUSx4ALOn85nwkiE/nGcHIo6QApod0nxFVNVkErThPzzqQejgLk3FPpHXaDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC2DSDarUKChjCj7SlhKs/MauN2GUZicLXE2AYK4U7B5hVwyy2
	1lA+AcSi0o+mCg2yuNb+1tS4EGyv2Sbe9BtDfykzMV4Hsi1s1SUx9Rq2BHuJMrzAk+Q=
X-Gm-Gg: Acq92OFqpzaAy7+dksOwZ5abtsaEnmy93W0i5SznPFJgbicKVGVELm6cY9i/EVCH2xE
	isIQ/3su5dJ5hSlW/pCRdDgxv7FrgjzHsR+VPbmyht3LvYaTm9y3wtWqRycu0hTmmBsRw43wRJ3
	fjmH8u7ShD40OvjTOmDJU2hDx9bEyI9j9NEEM62d+YDTApu4kGIxHj4IcznnfgcoxNHn9HSLFiy
	0QJIHg9gg/ARr93M4p1pbWIqPbFHZDBTnzvLg7E2cmVWWFQT4pcTeuoV4DvMjbJcSp3uY4VNxap
	mbZgFqChQAM6yGEqXXWivpQgpkmX49GuPkZoE3dWCe61PXGHieEsNVRSX7SoUcayYCAiCRDCqJv
	QzZVgk6opYipR7GfjkoKoFtW8ZkI+MH5TrjtX16fknSNidGK1tjbE/Xm4BW24ylrJt50w0OQkJK
	RG/tHsCJ0B7yx0v3rq3sGT1ZWERyDqvsAN0BVPgQl6i4PXTrZ0DT33m+N53+xBEUfy
X-Received: by 2002:a05:6122:22b:b0:56f:31e3:9445 with SMTP id 71dfb90a1353d-58658e1e645mr1935502e0c.0.1779456643672;
        Fri, 22 May 2026 06:30:43 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f25d708bsm2209109e0c.1.2026.05.22.06.30.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:30:39 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-575124e716fso2448094e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:30:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Rq/5M5/x7+jBA1B1lmlNEcyJDgMzUftjHkVIKQaQeLnEvOrUXZuvqNHGSaDsC3sZOrWZomuseWMwcbj5pROgz3g==@vger.kernel.org
X-Received: by 2002:a05:6122:4587:b0:56f:b2df:1791 with SMTP id
 71dfb90a1353d-58662daadb2mr1796652e0c.9.1779456639337; Fri, 22 May 2026
 06:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com> <20260520115144.60067-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260520115144.60067-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:30:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEDpM+rGm8-huk2gV4ChDDV_WQzOAZjcK0520Ub1+XRg@mail.gmail.com>
X-Gm-Features: AVHnY4Iv2TWrM_EsCr6NTGF_hpU8CUMgNrig3cwPwu6Sv2g5iw4mOn8563dN2mk
Message-ID: <CAMuHMdVEDpM+rGm8-huk2gV4ChDDV_WQzOAZjcK0520Ub1+XRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a07g043: Add max-frequency to
 SDHI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33004-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 44DE65B55CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
> SDHI0 and SDHI1 MMC controller nodes in the RZ/{G2UL,Five} (r9a07g043)
> device tree.

increasing performance by ca. 33%.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

