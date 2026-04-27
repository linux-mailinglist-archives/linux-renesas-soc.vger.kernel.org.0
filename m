Return-Path: <linux-renesas-soc+bounces-31681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL5bNTpZ72n5AQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 14:40:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 06384472A1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 14:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1085E300407B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 12:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACD039B959;
	Mon, 27 Apr 2026 12:40:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D7D355F36
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293614; cv=none; b=Wb6MA4rbXxCnDaR5sOXhtB2/cH9/EUBaZbVpllLA8o5R5/MaQjr4/UhIhQk6HCNj1zd04R+tq5Y6ttxTDQb+2U611yi5z6hXYBF0SDUlXMO+PsNiIl+p5ji1GcV4PrxWg8AMhDVgbr6q2YQ3EEL5TAXoPTg/bY1T/VJYN2LVo0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293614; c=relaxed/simple;
	bh=9Fkw2nHzd0jcBU63nsLw9TsU/VmPTpjWCDsbuOWp1Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DegKcxxddWXsiNsC+gx59Oo3kThpGFpafSE/krH2ns6W8EQOeTlY+UK6zzdRQZPbVBLrGZ6huhRlZASbH965nEZUz1ZjhmKrkWmngUkCaSzfOIGzjNNbcvdyM6CxifwUBvMLVS58/MBb6uAPBAlrXf9vWLZWfkiAwhG9qaUULmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso3564210e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 05:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293612; x=1777898412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mLdfPcCMerm9jSxUSMQpVhZltIoWZ/5WS8yzwZGc9g=;
        b=oYWHZfWhnaV3+EaudSZiXdlf2I5zG/Ws5T1ERynp426PQ6MfH2slVGhPJBr/T3dw22
         Dk/+HQ2Bbn9sIwSakFjGo+FFMRSaYZKO2SXa2AUNZZaK2g9Rz2TQdJUMSNtiWw2YowTC
         Zq0PqCHnMTxfYt1JCCP49xv94a0FVcKZ8LwY7LEsl2A7GYQNHQTlAuQ5taUVyCVTJ+9K
         DM9TOF84+masdJdWc+ea3F6kJ0CQN4+FPfNSBb7Kx7YpMMV85jYWIjbLIgzHDLPl/Va4
         rRP6U9oZ75cFxNO08V4JP6KbzWVp0X6sgj17/3KQuG47X9lwkd8Uthy95vMbOPFvxWCE
         K0GQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bzOsN+TT1P3PgpyyzK4etEzIu2NtGHTk1pKOCC7uXFE37MUk4vBqluhurQ4HRQXCgQBfqZbTWGWY5KwiUddKqng==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh68wfMEJVzx/CkA4gmjdH6JzPOxYRQMQrFcHpOhWEDUX5cvTF
	+sSgoyUuQ7ic6+ggp5H1113nTAxanFZjYKBWz0M/GtC5Dm0NRm6EGdr1o0w4MBmojhQ=
X-Gm-Gg: AeBDievZ/KsjABuieA6VtKoHbGS24b3D6PdPM1eoAxI+oeoylxfuRred4Qd4syHMyD7
	BCE8gG7Og3UnbT/hDkeCKHCT5Cu7ingwjHeoYm6T2c5aPtsPfpQZcHIEdfn+k+p0QqRnoQlw1NN
	+bC/c4XI/3pKRlY5Wh93EWJZPg/GlZk0G7J2Q/iW3KHWhzwUKZVZ9p4VRfjHsX6BDRXvormSZtk
	MTX6PBgR89yQpT90G20irx5Vq1dvlD68vQkPEHUPLrykwB2Bm3+ciwv4Gw356ItQ6jzRlu1T/4g
	elyVDbJQokXLGoX2zf5WgTfM/JEHADKzDCLxMfPvlxvsFwIZNqIcrH4Wkz61XKZq1EEomCPTNIO
	/xo5dLodwN39e2L6y/GzlJFOuWSbsZvn20hu36YFg27IvPxuZMcZLO+M+FuaEm6OykDRf1DnESb
	9Gg+vpKrJZTQbTTfezlBwuG61hOY+PJFD1WPc8kmOG5K3K2yLcf+BdU6OCiz0qzBNXlVXjV98=
X-Received: by 2002:a05:6122:4893:b0:56f:1ea2:8609 with SMTP id 71dfb90a1353d-56fa57d97fbmr19021954e0c.3.1777293612429;
        Mon, 27 Apr 2026 05:40:12 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa9332036sm17518289e0c.15.2026.04.27.05.40.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:40:11 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-610e2e8f57dso3626249137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 05:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8KAv6sxWBITPh20cnwPyPwOBDV4Y0uneRxK8JE1ofev/BgXZ1T4f1r+bq6L9UeQv374z6nKIgLhPtgQoRxOjUX0w==@vger.kernel.org
X-Received: by 2002:a05:6102:4415:b0:605:7a45:c7c5 with SMTP id
 ada2fe7eead31-616f772e9c4mr19149950137.14.1777293611470; Mon, 27 Apr 2026
 05:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Apr 2026 14:39:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ4W7Gjs2uHF+JBzmbEN-XL3+pnKSWO9kugxB7BfWODA@mail.gmail.com>
X-Gm-Features: AVHnY4Jn5h6-wc2ZEMcdSg_3PErpp8tISoj2_DA77h0UJ4kFfmvlw4Y9g55jhsM
Message-ID: <CAMuHMdXQ4W7Gjs2uHF+JBzmbEN-XL3+pnKSWO9kugxB7BfWODA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm64: dts: renesas: Add reset-names for RZ/G2L
 and RZ/V2H family SoCs
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 06384472A1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31681-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email]

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add reset-names for RZ/{G2L,G2UL,G3S} and RZ/{V2L,V2H,V2N} SoCs.
>
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

