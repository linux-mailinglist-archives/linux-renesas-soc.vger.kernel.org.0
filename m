Return-Path: <linux-renesas-soc+bounces-29050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMZGNg6NrmnlFwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 10:04:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41207235D8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 10:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1390303A25F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 09:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18FF374190;
	Mon,  9 Mar 2026 09:03:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964BA13AD26
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046982; cv=none; b=GD9517xh4H7XoPhvSmmp6vcHIngNdSOO5nloDqo1oUv92JdsKSimabGgOV89YKfHs60T+hB13LDRYZGxosvt2ziXOdrKtlYBqrrWbNLcmfejjVV+vlufDuVLz4ETZ/EHnj6qVrXFXyaPK1wScMS86iJiXCAfoJR0FwhWfejJhGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046982; c=relaxed/simple;
	bh=+SvpTPCt3UmTajloqWXffF83Z0jPUDgrYCgmiUYedxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdFivxOu6KGOKb96NoLBYioycVgxFrEaJ5VKxLJpOGNZnU0GTcuTXF9HG4P37Lrk6kzr8pS7nVozw3puKh0N9Uy5u1Jf3r+Pqal8W3MkoenJiga7tCWvWLHa2AMxMGWhLHPTVqNTzVp0QGyor3MhOvaoJGoON0rTBFRSGzAOVGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94de4f5531eso3580736241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 02:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046980; x=1773651780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woFrl7jRlBwz5NvQNkYQJFvnP2BKvE4DuuKsF2voteU=;
        b=ljXnqUAhhQRZDi9dzhsJyTvzoDKxRs8dYS9jRGOgvdKahHQ8bXOyE7dOJdwsRNH+Kh
         Ap6Mafm2ViYADPGKaMdEuSb5xwRasVV93qawRzGMyjwXkoRFvnich5GU+03zIpP3QQJ2
         EBb6enlN8MpIDG3MZ1g81TBgsmfT1yqZTgsqdHzVrm+YZ+V6cmxg5yvc2/lVYLUfILZg
         SrItXThzXyok3eoVSHPC4aIWvJm3QtoFMsoPg6sRosVMxLS86t+6nj0urAAWqKuv1q+f
         6IRgevVp3uqjyDHcx08bcl8nDX52t7/YMdRwdyNUrv0tqPvV4UVzqBP4eUFSzP6TLY2w
         Q2Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVk8JjEy/GKlPJx2cLopZmBypB4YxIn9IdxSI9sns5o3+ajRNEBWNSm3i5YIxzbQOxF1x+0NzSZrTh7Dbo0w0OF8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnlLJX1DhrP4lf0FMIZXor5WBP2mEL1PFyhXMh8sJDIFf37v3G
	83BDe8ySPWqUHezcDzZNBPoTKchQQcNm90aYu26EiNwfdLl99lnU25UuqdHXwPHu
X-Gm-Gg: ATEYQzxQ6oo4i9IoJmGj79PdB4JONgLdTBm7/eRoRsIVt6AcpQOb2cxxmqSiAKsMc0r
	31m7BLnelHwch6ESh8WdVIXkxmyZH0fo7r/6aHQ8V9dkBFM7MX18YTrU6D0fi4ry3CIUPFO4HkU
	2grSMSvVZ9Spf/ht5Gm5CInuj3ZpsvfVOwCZgSBygbUGMPMYbPgwC01RgA6urAJ+B5NiVLCDugJ
	vRYy3yqYu/LlBUBxm18QnwMN2cyl7NGkz6Yb9P+4IEGz8nf16jUF6HDfg1ifgA0nooQCHYkRCRm
	T9K3fpiw2dYjbj4rnd66OpVZX/BUB82vcheAMC6SQmh5Uhw6JRJlmnPsFluR9g9xrgVsMuvm9q3
	1rp08718tKDTyS9yxzVZs8k6kK+VE7OXUmwIfC4olfg+fUexlTbY627Hay4g4cDKg6yzifrSwUs
	wXb93jjRnXAzIbmwJh8t4jNT/N+sxsjOImC6ATSr7coXYLx0RuWsuVpsXTWRyX
X-Received: by 2002:a05:6102:26d5:b0:5ff:be25:8934 with SMTP id ada2fe7eead31-5ffe5ef4af2mr3027247137.8.1773046980306;
        Mon, 09 Mar 2026 02:03:00 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ea681505csm1454546241.4.2026.03.09.02.02.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 02:02:59 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94de4f5531eso3580721241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 02:02:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbYebZey7TBmXDJ6lLGxk2MVS1DLzk2Udlwfky73HYtFUx5dfm0FdVkAqzaNlepKEEp8NtPGHh7uRjHyo70abTjQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0b:b0:5f5:40ab:2d65 with SMTP id
 ada2fe7eead31-5ffe614cb63mr3587596137.22.1773046978396; Mon, 09 Mar 2026
 02:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306145819.897047-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260306145819.897047-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Mar 2026 10:02:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJuWVR_SvjTZXA0mtM==p_kcR3LWjuYf_c83U9Z35J-A@mail.gmail.com>
X-Gm-Features: AaiRm52y7ZyQNCmU3B4H1jId4AxkZXSLWMRot7Mw1tDnya6wSfnl74jLyKkpMyg
Message-ID: <CAMuHMdXJuWVR_SvjTZXA0mtM==p_kcR3LWjuYf_c83U9Z35J-A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: dma: rz-dmac: Add conditional schema for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 41207235D8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29050-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.158];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Action: no action

On Fri, 6 Mar 2026 at 15:58, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L DMA controller is compatible with RZ/G2L, sharing the same
> IP. However, the conditional schema logic that enforces RZ/G2L-specific
> binding constraints was not extended to cover the RZ/G3L compatible
> string, leaving its bindings without proper validation.
>
> Add the RZ/G3L compatible string to the existing RZ/G2L conditional
> schema so that the same property constraints are applied to both SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Fixes: e45cf0c7d9b960f1 ("dt-bindings: dma: rz-dmac: Document RZ/G3L SoC")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

