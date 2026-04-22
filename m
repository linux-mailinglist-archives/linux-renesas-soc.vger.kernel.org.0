Return-Path: <linux-renesas-soc+bounces-31494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP/PDB2d6GlNNQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 12:04:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E2644466A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 12:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA50D30921F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A413CAE95;
	Wed, 22 Apr 2026 09:57:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C2F3CAE71
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851846; cv=none; b=tQqdrf46cojnX2HKNkHztBFBGqz20/UdccRh6onVswKMJuhRKvv+C8K3sGqCexhL2i/I8ZyrkKHdVQQUeD0wqmcP/oiT4aE2XQg0lS5qbvjVMpkpq+V2uNyM+DP4ttFb1409FjvHQsBqPleISf6hYBrNQxF/s1yp+3uHeKTi0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851846; c=relaxed/simple;
	bh=6mDuNq45KeFm896CsiVIYXGWEBMDyn7lRDkAiVSdchE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSq6IxFu1wfjOOU2HW3/LRF0gGi+qoKkd9QtxKgClHgNEbK+MRDWgYfEXy2EwaHm+HWC0qxnr+xtoVVxsTT5BaA6sUXd2vtnvGO2LAa7dBP5oYID97QUR5gwBmJ8eMXBGjXWv7ZMhyG4XpnnqxTmraEw1gajEq4UEeE6VlKB1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-60579b9c0ccso4084127137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 02:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851844; x=1777456644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGUAES2iGSzBFF9bZ8WHBfj8QFYxk924QkB8alfO0Ig=;
        b=RwuS9bTGy/35wxkTj+INKECGf/lF0/qWREGdABPaSb3lpcxDlb5iDUCc2D8P5/lkCG
         kYZC50WcQq+YzInnzyKou5Q0/iAP/3xGzN5wiTVPbx1rS16zMelpXug27+0xWiYk3Kci
         O7UZDoOU5XuRZija9X0FzWFqWWfk9AltqGzNsmAGDupSDm3NduHJDxsjV8Y6lfGHMSgr
         L1cz3vMoSL3uBd7te+h8wfoc/+gA5sUjpuHZgIyLyxMg+IGRrWCMHif/9REoHRR51lwj
         kxRbLx2GUekzieuKhUiqys9kQmMPvD6wgnfJXbKXMVrudICDc7T5A6uOm3KfDxhM7ZYi
         LD0A==
X-Forwarded-Encrypted: i=1; AFNElJ9gCbsZGXdapE2oJc4QSFrKvvwxOdNaXEw88Ftz1ZNvhE8017197tEt3fTBPJsUg5Wo7dVqP82etaz7IFXb9gmv9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFEd7IydBuQ/CwbkJEeVqk6N8eShOFBtVvfzD+npmE0OCT8N+d
	jcelYofIDcqMB79QYOqAhaHgmKFczcjstyP1PXT+p0dPMDt46wn085MQnvje+mPdFeE=
X-Gm-Gg: AeBDietcy7Bp6rhGiXN4L683cmZ3Ahh0rj+ii9AXyoVZGZMXavI4i45M4SVW+nTtf0z
	cxWl4ZnfNBYUCX51L/L9TfDhDyHcxQgTKETpbU8kC/pC6cNowA59jyDcXgu5BXKITIWM/ROeVFT
	FZARBkSHT6ZkKtLzdDrdJnxzEPJIafKMS15pOhDKD4FrrbBnh5jxjufw7o2Myp09Or4WcNnAhPf
	1rP5Qrai7ckdOfLVS7vwEXLVFUdA8ril4KegoetEg5V2b1mjRs2hgP9tz/yaPgtplXm6X1ecf4F
	AaxqqxcIueh1tQ+Kv2gAbDASN9TCrJPg/JWECLzzu7YL9Bl1n6wVcXTLxkvS2+W3UfyYLxEngcL
	CKVqHwGbRl3xOB6LA29U5G/JZ2F4jkz0dP5lSlbXPqBAsZOZmvt0XpWwXfK9hlt562NzQ691SUL
	5Zj8EESaghNAy7WOyoYKLRVf+YkuMFQvRF2ks11Mj//LOiSirWQpMESF9ekNdo7ypUfLbpw78=
X-Received: by 2002:a67:e718:0:b0:5ff:cd6e:85fe with SMTP id ada2fe7eead31-616f58ac93dmr10981767137.12.1776851843566;
        Wed, 22 Apr 2026 02:57:23 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890bc746bsm7694931241.8.2026.04.22.02.57.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:57:20 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-605823aec55so3309171137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 02:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8V74LITdC4VxrFSkZrA3DVHz1J48+eBVg5HPi6vftNQOKycJlEc4zlQPY/DF2TjoJtpi58KOnze+ozhuSFz3bz8Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5ff:b8d8:b40d with SMTP id
 ada2fe7eead31-616f71f053amr9254255137.21.1776851838676; Wed, 22 Apr 2026
 02:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 11:57:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNwMU-TSOSuHseHN_=TJD8H8ufXbELhw=tbNnEu9fUfA@mail.gmail.com>
X-Gm-Features: AQROBzBvB791V1AlJ4m6KSvT4nDoXmDRU5p3nCcbvfGNvDCmLo9cr0R-7oUZKkQ
Message-ID: <CAMuHMdXNwMU-TSOSuHseHN_=TJD8H8ufXbELhw=tbNnEu9fUfA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-31494-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16E2644466A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Fabrizio,

On Tue, 31 Mar 2026 at 16:52, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/T2H and the RZ/N2H state
> that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> interface pins have to be configured as specified below:
> * SDn_CLK pin - drive strength: Ultra High, slew rate: fast
> * Other SDn_* pins: drive strength: High, slew rate: fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> Adjust the pin definitions accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

According to Table 58.11 ("IO setting (DRCTLm register setting)
condition"), the recommended drive strength value for the SDn_CLK pins
depends on the transfer mode. So shouldn't this be changed at runtime,
depending on the type of SD card that is present, using different
pinctrl states?

Currently we have:

    &sdhi0 {
            pinctrl-0 = <&sdhi0_sd_pins>;
            pinctrl-1 = <&sdhi0_sd_pins>;
            pinctrl-names = "default", "state_uhs";
            ...
    };

I.e. it uses the same pinctrl state for all modes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

