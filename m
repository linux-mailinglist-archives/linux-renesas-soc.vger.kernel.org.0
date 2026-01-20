Return-Path: <linux-renesas-soc+bounces-27102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qImfFZJhcGkVXwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 06:18:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC151516A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 06:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 209867CA0E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 10:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA4E3F0756;
	Tue, 20 Jan 2026 10:49:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D0B3D1CCA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 10:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906190; cv=none; b=BBvx5tfVttRbSngCQhN2y+hZ+YVwPKSSEU+Gj05SpH1d+Jy3+DrV34tc99wqNgDkzcN0hAH09iYxj9iqjSYdTpMu5Gvo5l2lDDUIDKTzNkxveBm92HyEy52zVBUxtROHEdw6e4h3CO7pat7qLuYFai14SBFRPJFvFGyr/25asTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906190; c=relaxed/simple;
	bh=Jo14SNVvgAvpmCa6sHx3d7iO2VYD3GagcaTjUOnITWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5wZKoZGVmH1XYGWese8waG7/7o9hUiLLXPWC9Ghfh4Ikcc092BHhuFNfy3VQyfcGNxMYHQBj9jCV+VtcxZG3OHsilqzFKnF18m2aIt7D3HNvJrAUPO90pdPotGsJ2DODISwgE7eERmS7ys+8ZdtVr/jCk76ZpyqPpE5rq2QIs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5efa4229bd2so3413793137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 02:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906185; x=1769510985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZ0wVYmrXY0w9NWoQKTsT/lFDBKGzH8gk5CbiyOvxNo=;
        b=XAFWol/P8Hth1qhWVGwpbzQSO8C+GaVH1hxlic4A/r7VtdzALO48zb6d9fxK4qHp+l
         e2+4ViDHCp3xdX5oxGgd3STNmW6EjedlzWPhmX0djYG/LFuHZazVx+jxNvlVXRfKmSsy
         KXmpIQ2JS/61jcu6g7pEIsS2Nn4sc6uaDcBOW4D90s2KdF+6Z6P4Eo47sLc4X9EgYP63
         FHvLJ1ckN0cIFVnRzMEDm0IRxWn2Ue/6DjY72ZdBj3c5K7BqVURF0yDh2UN5S3XZyygP
         aOm45k+tjnSrRgS8hLoU9p7jHb3d6nxdLXbuneDZSkvgVSRk4RUxYkZC5nIuAYYeurHv
         7Hpg==
X-Forwarded-Encrypted: i=1; AJvYcCVkqkBQARE7B49d1MDIdSxN/eDVihvz2Uwopt1WgfNFgwvJPl5A3sR1S9QZMJx8A0RTGftmw4XlDFFJiYnsitO2QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrAFMefIrGv4lG7RRAsn5uSFypu4JTTP4rLAt6JXoPR44RFqTV
	QhbbIFl13HUxEgqsbWITU+gPr5kraPWE8z6vuiylVbKo/ApZ7S0XGnFBEYmwGoZ5
X-Gm-Gg: AZuq6aIC+bNwIphwIcNu0hP3l/7PPytiBp2PSvCVBENSKPqv8jYJx7PTvAOIOesSiCr
	kCTi5hUVDZwI+LzsfSZINwRKFb8CHkb1BbpjOMf/SFBEQNqujKaz/HZFMt9R2sAfKPhHHKPmZoP
	mQNUOVYBfT9iXURz937BhROiyXLQyCWabnTUhgmZ37F3pOZDxOYgtT98LEU25ymtzLLbWqJI5Ej
	7hR466V/QIUzBN3FvXavdhNTvTe+7wSTn3m0vtKDbfcmDM2qYc1GzPRPDlZaz5X2lfKNJjdQsrj
	rtod5vKDSf4rNbBhLDrXxnlgBPTm301onTPenNgGcQQt5AJjHiXnzS3dOyL9zPiyug1Rv0iKsL3
	LcNYmL/Dex83gLysJTK6aSX3wRXqNcOxjWssx4RGyTTfFWqyv/0hDwdF8K5B8+/MGqH4KP8UKWI
	yymurrBt2y5SVxMwOuGaBNNj+J1uusybskq8fXkkWlKSdubvAb
X-Received: by 2002:a05:6102:3a10:b0:5ef:23a3:205d with SMTP id ada2fe7eead31-5f50aa0ed54mr334562137.31.1768906184621;
        Tue, 20 Jan 2026 02:49:44 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6925223sm4179306137.4.2026.01.20.02.49.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:49:44 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-93f5761e09aso3134065241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 02:49:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXx3ZiyM676/FE+ZmBieFT6hBjS+EpR1orM/MeZ0jF70l84+xcSbImopWxUFjBQ7prqGLsh7XXwk/p3oCdY/wudjA==@vger.kernel.org
X-Received: by 2002:a05:6102:3f56:b0:5f1:4fb8:6b92 with SMTP id
 ada2fe7eead31-5f50a9d3b46mr342934137.22.1768906183803; Tue, 20 Jan 2026
 02:49:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com> <20260114153337.46765-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260114153337.46765-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 11:49:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
X-Gm-Features: AZwV_QiaybW_I-1gR5s_n3JOLx29V6BZF-xoPK94FskYw67mu-RW2omq6aWspo4
Message-ID: <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
Subject: Re: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off clocks
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27102-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: AC151516A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

On Wed, 14 Jan 2026 at 16:36, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Some peripherals may be left enabled by the bootloader but should be
> explicitly disabled by the kernel to ensure a known initial state.
> This is particularly important for PCIe which requires proper
> initialization sequencing.
>
> Add new macros DEF_MOD_INIT_OFF() to declare module clocks that should be
> turned off during CPG probe if found in the opposite state.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I am still wondering if there are any possible bad side effects
of disabling the PCIe clocks, e.g. when PCIe is in use (network card,
SATA card, ...)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

