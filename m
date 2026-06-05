Return-Path: <linux-renesas-soc+bounces-33609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xp8qAOS6ImpwcwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:02:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D236647EA5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:02:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rOiYAipi;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC5F630151C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 11:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F00E4BC00F;
	Fri,  5 Jun 2026 11:55:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965154C6EF4
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 11:55:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780660517; cv=pass; b=Oe90zrWEXkP6ZS/UB84ua70nshI1zA8AkbkHrddlgIG/MmVEEMmVq9mcfFlZQqByBZvnfj5JG3FznxyXagqbBbDzahZDV0Xa7XkJJvTM4Bol1wzmJTp184SjFh2aYVPGigqZJzbssaB0M89VMydKvyBsNtznBg3+V+0mhErSB6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780660517; c=relaxed/simple;
	bh=yAV2IqFZk0cBvmTqD1yhsCjtpJ5DzXtfK4LNoJf4AHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GM9IxH13IWxeFMFJ5+6aHJyy9bBGQdXt9YhValcY1+LHFCWOmZu4bqqST8k1tEhg22PCVhlrCGbazza3pu5srWUcoyHPa0i/6P/4NNdb7Bck1rJLib/hWsN6AfBNlpELl5bOKmths34VMSHDWVoeDnDwNfAa0bpmxMk+7Er2BGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOiYAipi; arc=pass smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b7866869so21672425e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 04:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780660514; cv=none;
        d=google.com; s=arc-20240605;
        b=F01aotP3AEjjuFVJEXS8KSEI0+TvduafhwntB83TNlT5ctk3Gu6vT6Yq22hMNE5g7c
         3Eq1rRj5sX6LQb9ffsK4EYKvAMf3HPXMrsmCdWYXndIdeyayGPw2CmZlfqGWr0gUTl6r
         rHpJjeYElIwdrPEUfRVqJTZDT9hXmPs/P4RkNiowZnsh/759GKIOAmTFCtzg9Lvk46Hi
         GAB/qX+mj92z8rrIDS9Hoq7tpHOGa6frm3J9LVgfudAIsTUpGTlI99YPJWBdRE9Q1ezl
         M1zDyfWKPfv2BGYTY+GAYLsrOPcyDYXnZO7vA+o8ugYWlShDRHTbMvkWGAc5udjdjAsg
         AwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=//GYdD1yw302I0yF7ELThPMAvwk15VF1Q6zXK20rZgU=;
        fh=LwQ6ZSBt36ukPbGrUo5SpBRTxwRHnKh0vCcw1J0GMr8=;
        b=a9xFJL0jZ4vewtCgEgNQuP7/xpMlUADZ8/G+9EF1Bybp6+PtxFpkZ4DHuIygJnJCQz
         3cTHZtc0wKvXK1mbzQeTruoGfvuShQxHG8G5iHmgXR0jdA38iiZS42ZFeDOImjBcz9w6
         tER/mNi9VH+qZ1J1FNp4ZDXZ2RHJXtazAf6C48zhyz1oPisZ4MzU8s4WSZiNARHDse6/
         SWrebe3vq+yMZ8Jvatv5CoS6/iM3o60373LT06hIiwQ0zCZ+NCb0yKA5CFYIBA49va51
         JChFcDn7Os0XDuwAcZEbRBkko1gvsW3pxgnLoetuZ7mIZHDVesRybzGlGPhgvkRnrxCV
         uAVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780660514; x=1781265314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//GYdD1yw302I0yF7ELThPMAvwk15VF1Q6zXK20rZgU=;
        b=rOiYAipiboBVsqdOJTkr5py9fojcBM6dvHDyQCrLMVanyH9xZq8xCfa2bteJn+LCAe
         9q3qAYB/48tTj/MIXofqJECKeY15EaM0jMx4GCBjuSC37tnaDViyw1J+HGOnta9kXtwz
         KZs/obvbgo1RdqQ67cp9DVDv0AfXO/AuNgov6kzKETEl1NVAtxrzGmvI1sC4gqO703g5
         nEG1MD5VvXddAwKfZP7eTrRGf8iVw95HVH9j0HbOVcfnsJErS3U42BnhBg0vQhsKMTGe
         sOmU4wGkb4BDCBMS4oFh/g0gZcx+YvH5qQQnbldqKjYBAmJfqHbcI2IITbF1aovmJIhY
         IMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660514; x=1781265314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//GYdD1yw302I0yF7ELThPMAvwk15VF1Q6zXK20rZgU=;
        b=bzZSXAbI1ivSymPi0sPmOW4z3EAYg2U15RaxYo7QU6PouyfaqT/E4EtpmB/Fn/pOrd
         G7BYNM7hQpd+oxeUfA5uUbW8loXUYCWIGFA1p4gFwjerz1reNRkh4XRIH7/azMBJLnqz
         cuXOIojXtmPSxhc6SJIl9WFNz8W3F3FLBrXBrMp8SPpZKw6mvFJqY8KrN7tpACRxucA8
         lN5LKlXbzzXzgCsbqZRHN1aZGgyh70E8zX1uLf6ajRPgFTT3DMqJmeRzE0K3IcGRToVZ
         rNHxzHZJA8jm+pq5Cv4kwpRS2Hjdx2Ia7RETzVhuw7skVQvPqM5Mbc/WE8Pzi/52SKrz
         IhpA==
X-Forwarded-Encrypted: i=1; AFNElJ80iyMLeCJnsQf2ZqKaakftAxrlKShRWQ9luyNZmsw8HfpR7IHrEORhphUGKAZNWTxji5wjn07c08or9XnOIszSHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXRYsLwNyRUXD0NBokDLr0rNhgC6dJFzdvzvGPGLFAviJTZ2s
	n9d9M5ht+jKCqF7HrvQ7BSygL+JYGO1syoukE6aAxMcR7T5f5kDLwc0pdwqmcabZGclMdURUXjS
	0AViMbuzOnFYZ8b+zkYgBzmXZ92Q6n1LXodqRePM=
X-Gm-Gg: Acq92OHZ6ahtI4QZ1PbVhXQYRcs2T64UmmhXV9ZzyVK6a13iAuG1YSQL9i39+hjDMhR
	ULvUewd3wlPwrKYwTTZ+u2M+6ZeSHhFu7GbPOe3nX3BX20q0JDKrk7/GAHsNxocbCa4NsCrcnDj
	lmOrKDTL5itGJcAXHxZKiZVP4F/QBslnjT2hrY4FvFcLQocD2lofhgv7OVL67Uo/nS/O2B30eJO
	gweoSfc3j8jfp88pMouev5a9iRJkOSdF3upPDI2TQpA0wTuDxJXm5IFgPljOCYwrW8x6VBZEgyO
	p07Dxt3l0WFOZYruG2uG5x5o4rGo6FfoZy0HGx3No6cjtHHXNiB61qsUE347HbS5aXsBpmUNPZE
	2UKs=
X-Received: by 2002:a05:600c:4fc9:b0:490:b8c0:d474 with SMTP id
 5b1f17b1804b1-490c25eee06mr49053305e9.14.1780660513812; Fri, 05 Jun 2026
 04:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
In-Reply-To: <50a908557bb3ce5f14b67396d1e73e70289a583a.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Jun 2026 12:54:46 +0100
X-Gm-Features: AVVi8Cd2p_5wb21Ju7uN_UymgXZMavWTnmT2NoxOvQc6wSw-uyndN3rDgEYj9Gc
Message-ID: <CA+V-a8uGho2RMhreDgieOOZTggUALoF0bGyjdEEDvyL_75sAyw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] PCI: rzg3s-host: Use shared reset controls for
 power domain resets
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33609-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:claudiu.beznea.uj@bp.renesas.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,glider.be,gmail.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D236647EA5

Hi Philipp,

Thank you for the review.

On Wed, Jun 3, 2026 at 9:16=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> On Di, 2026-06-02 at 20:50 +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Switch to shared reset controls for PCIe power resets to prepare for
> > RZ/V2H(P) support. On this platform, multiple PCIe controllers share
> > the same reset line, requiring shared ownership of the reset control.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Added RB/TB tags.
> >
> > v2->v3:
> > - No change.
> >
> > v1->v2:
> > - Updated commit message.
> > ---
> >  drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/con=
troller/pcie-rzg3s-host.c
> > index d86e7516dcc2..a5192e4b58df 100644
> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(stru=
ct rzg3s_pcie_host *host)
> >       for (i =3D 0; i < data->num_cfg_resets; i++)
> >               host->cfg_resets[i].id =3D data->cfg_resets[i];
> >
> > -     ret =3D devm_reset_control_bulk_get_exclusive(host->dev,
> > -                                                 data->num_power_reset=
s,
> > -                                                 host->power_resets);
> > +     ret =3D devm_reset_control_bulk_get_shared(host->dev,
> > +                                              data->num_power_resets,
> > +                                              host->power_resets);
> >       if (ret)
> >               return ret;
> >
>
> I have a few questions about this.
>
> Can you move rzg3s_pcie_resets_prepare_and_get() and
> rzg3s_pcie_power_resets_deassert() up before setting
> RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> rzg3s_pcie_probe() without ill effect?
>
> Can you move rzg3s_pcie_power_resets_deassert() up before setting
> RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
> rzg3s_pcie_resume_noirq()?
>
> Those would have the same effect as the reset already being deasserted
> by the other controller.
>
Yes to both. I have reordered the sequences as suggested, and it works
perfectly without any ill effects.

The RZG3S_SYSC_FUNC_ID_MODE and RZG3S_SYSC_FUNC_ID_RST_RSM_B
properties configure registers belonging entirely to the System
Controller (SYSC) block, whereas the power reset "aresetn" belongs
directly to the PCIe 0/1 controllers.

> Is the "power-on" mentioned in the comment about the delay in
> rzg3s_pcie_power_resets_deassert() the same for both controllers or are
> they powered on individually? Specifically, when the first controller
> deasserts the resets during resume, is it guaranteed that the necessary
> delay has also passed for the second controller, which is resumed
> later?
>
Because "aresetn" is shared at the SoC silicon level, whichever
controller finishes its resume routine first handles the physical
de-assertion sequence and absorbs the 5ms fsleep() stabilization
penalty. When the second controller triggers its resume sequence, the
reset framework safely intercepts the request, increments the
deassert_count reference counter.

The delay is the same for both controllers. Since the reset is shared
between the controllers the one which comes up first adheres to the
delay and de-asserts. When the second one comes up it just waits for
the delay, and the de-assert operation doesn't happen (instead, the
counter gets incremented) because the reset is already de-asserted by
the first controller.

> Can the reset_control_bulk_assert(..., host->power_resets) be moved
> down past setting RZG3S_SYSC_FUNC_ID_RST_RSM_B in
> rzg3s_pcie_suspend_noirq() and in the rzg3s_pcie_resume_noirq() error
> path without issue? That would have the same effect as the reset still
> being held deasserted by the other controller.
>
Yes, as mentioned, RZG3S_SYSC_FUNC_ID_RST_RSM_B configures registers
in the system controller.

The only downside is that up until both controllers execute their
suspend routines, the reset line will remain in a de-asserted state.
However, this is expected behavior for a shared reset topology and
ensures neither controller disrupts the operational state of the other
during a power-down sequence.

Logs:
root@rzv2h-evk:~# lspci
0000:00:00.0 PCI bridge: Renesas Technology Corp. Device 003b
0000:01:00.0 Non-Volatile memory controller: YEESTOR Microelectronics
Co., Ltd Device ef25 (rev 01)
0001:00:00.0 PCI bridge: Renesas Technology Corp. Device 003b
0001:01:00.0 Non-Volatile memory controller: MAXIO Technology
(Hangzhou) Ltd. NVMe SSD Controller MAP1202 (DRAM-less) (rev 01)
root@rzv2h-evk:~#
root@rzv2h-evk:~#
root@rzv2h-evk:~#
root@rzv2h-evk:~# echo mem > /sys/power/state
[   56.187674] PM: suspend entry (s2idle)
[   56.192194] Filesystems sync: 0.000 seconds
[   56.203463] Freezing user space processes
[   56.210884] Freezing user space processes completed (elapsed 0.002 secon=
ds)
[   56.217890] OOM killer disabled.
[   56.221149] Freezing remaining freezable tasks
[   56.226901] Freezing remaining freezable tasks completed (elapsed
0.001 seconds)
[   56.234336] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[   56.281005] renesas-gbeth 15c40000.ethernet end1: Link is Down
[   56.281829] renesas-gbeth 15c30000.ethernet end0: Link is Down
[   63.409122] rzg3s-pcie-host 13400000.pcie: PCIe link status [0x110034e]
[   63.700160] rzg3s-pcie-host 13410000.pcie: PCIe link status [0x10030e]
[   63.915436] dwmac4: Master AXI performs fixed burst length
[   63.915549] renesas-gbeth 15c30000.ethernet end0: No Safety
Features support found
[   63.915681] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008
Advanced Timestamp supported
[   63.915908] renesas-gbeth 15c30000.ethernet end0: configuring for
phy/rgmii-id link mode
[   63.924556] dwmac4: Master AXI performs fixed burst length
[   63.924659] renesas-gbeth 15c40000.ethernet end1: No Safety
Features support found
[   63.924778] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008
Advanced Timestamp supported
[   63.924996] renesas-gbeth 15c40000.ethernet end1: configuring for
phy/rgmii-id link mode
[   63.936404] nvme nvme0: 4/0/0 default/read/poll queues
[   63.936559] nvme nvme1: 4/0/0 default/read/poll queues
[   63.937729] nvme nvme1: Ignoring bogus Namespace Identifiers
[   64.032789] OOM killer enabled.
[   64.036185] Restarting tasks: Starting
[   64.042572] Restarting tasks: Done
[   64.046083] random: crng reseeded on system resumption
[   64.051750] PM: suspend exit
root@rzv2h-evk:~#
root@rzv2h-evk:~# lspci[   66.985040] renesas-gbeth 15c30000.ethernet
end0: Link is Up - 1Gbps/Full - flow control rx/tx
[   66.985076] renesas-gbeth 15c40000.ethernet end1: Link is Up -
1Gbps/Full - flow control rx/tx

0000:00:00.0 PCI bridge: Renesas Technology Corp. Device 003b
0000:01:00.0 Non-Volatile memory controller: YEESTOR Microelectronics
Co., Ltd Device ef25 (rev 01)
0001:00:00.0 PCI bridge: Renesas Technology Corp. Device 003b
0001:01:00.0 Non-Volatile memory controller: MAXIO Technology
(Hangzhou) Ltd. NVMe SSD Controller MAP1202 (DRAM-less) (rev 01)
root@rzv2h-evk:~#

> The power_resets are initially deasserted in rzg3s_pcie_probe(), but
> never asserted in .remove. This unbalances the deassertion counter if
> one controller is unbound and rebound while the other still holds the
> reset requested, which would cause the reset to never be asserted
> during suspend.
>
Since this driver explicitly sets .suppress_bind_attrs =3D true in its
platform_driver structure, manual unbind and rebind operations are
completely disabled for this controller.

Cheers,
Prabhakar

