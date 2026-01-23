Return-Path: <linux-renesas-soc+bounces-27322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEFnKmVfc2l3vAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 12:45:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315A754FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 12:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCB99303299B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 11:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25D836C580;
	Fri, 23 Jan 2026 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awxm0fyh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E7349AE1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168384; cv=pass; b=caJahH6du8AbGxwBMeplAAgqebWub+wAsg0nS8WleiqI4snV4Lbs8EQzxhzJ3MVqu4QsRxPaIKH3oQ0D1CwYx74rXu9Dshjs3rNXGCZLrYeefbfpKD6V9/RMbSHFjApylRdKlcn9QbDCsRckicWavFBVxGPDVUJdKap6XPcZH6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168384; c=relaxed/simple;
	bh=aisLc2ieM5f1wTihT8PCwhs96cakpU8DJktm3rN7jzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/NNha4Vuz7m8GwWAWxuT1UZAcnykl4zaM5uUXXN/VOVBP48RNZBvLu5vDPbY6lvr2wsz/oNxLJc8A0wfWMM3jzto2zDXbp5Y90BEJTAjcmMlFpKssUEDYMkPF42HrZh3qmNMgs3tdSJis6dT5FShBErs0alB2jCkT8St9oSlNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awxm0fyh; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4359249bbacso2040809f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 03:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769168376; cv=none;
        d=google.com; s=arc-20240605;
        b=ldhrNQNvVYDMAf6esrIaxKPyNKjqaS18XWqHqG1NyixbgaO6qrQjSmDtErX5T1Zrrf
         EN7wExVJrG/f+mggvAFLV8A0ZGEjRx3i/YIR2Zk3fdCm+zy3xFayOsOMedDOnZc9JYO5
         W7DI7AyObq2Hyhy9L8Tq2yDT2llk9wzXvidBp9kgBOeBsogSxccoNtaNx7h8frK6PTXd
         tAt3VBG0vXD1Ex/Ii1HDVYr6A88HWzFz/AlEw61y/qNJHkwdRCJXnjVkcpUXrRf2S3+j
         JgkOJyELx1Z0UC+hob2rpB3Z1jHGxDwJD6GquYa4JF2V83pAC4iRGdl557xghdmuudqT
         sPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aisLc2ieM5f1wTihT8PCwhs96cakpU8DJktm3rN7jzE=;
        fh=CqXqb1zu42YB8FRlA8vkDPdq2sSaf+Awr4zHvUFLb/4=;
        b=AIQFO4tqJfmAcR6DGwW+O8/bVzvoaUvVNEnGA7gMoo/7TEbUANB8w9cwm1rMYtLtw7
         zLOJbwE+zvEcofctAPowEATFLbiRh/xYsRhkm63mVcuiXgmB041uRhQwRDDT4e63HzNy
         Y5HlhChVkGc19+kzh5prOSS66oXuZ3bhk/Iq91kJ30xxlIX/EIdc61Swg0C7jgLgHC7s
         lkC4Qv17ZzCWW5FbxEgG9PmFZVoo7I2dtI9TkoMjAtParK2V06Es68l+A9imfNos4tkH
         KF43KX8zK5aM3q75fhiiU+CUfveCb0wjwk0jO/5g8v+GX8DvVWkH/GE4FvMN97BsHuog
         D+pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769168376; x=1769773176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aisLc2ieM5f1wTihT8PCwhs96cakpU8DJktm3rN7jzE=;
        b=awxm0fyh/ZuqSBJYDoyOrvalD2PTMdShhFS5lFlTUkzxdPCgj4vDnskcz+OY8H2NKx
         RF6a/PkK5l8UOMmu4I6gNf8LVzTk58x1Z6ztbSpBWclkK3hu5G48x06ZF7KaKHLjw80q
         0cLEtRETx1w35OlP6pf+Fa8hZn+sbzBlGxp3wa1Z0pSNpXmcsg6Xbulh/dwXfOJ2DR5h
         sRB54auc0BeL+U91KMGU0Y/4leHeewREx9Tz0zhEIrvjfuISZEX/sXqWezZfaxGWjEQc
         YJkLfgxWjzP489vpPygx3Cjvye5KnSD8edaxL4DJpTBqfZoIZ8mxLlAgPI0mRixsB9Hd
         v6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769168376; x=1769773176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aisLc2ieM5f1wTihT8PCwhs96cakpU8DJktm3rN7jzE=;
        b=qlj8dtFQpoo0rPB9ZmjdklV55+f17hgvY2Vt4eWUtHmAPlSsH+aMkA62Ij3sv6mLqX
         3GxYnR7rnqOLtZbB/pVvQaSW6hqP6eHtAijUcR6vbs1KBMGilnRnoAkElXybjmXzPUwx
         TmTgLWIthuVpnQyrFApbVAV/cJ5ln5Le2fHWqTUUJY6c7dfCC1Auf/OCRUE8K+a4qZJL
         znjC4hjJVAYo5GjG3x+o41OtsTbH5guG2sc99lGVqDYDTijPr3cOMU7Ir3SDusk40Xl3
         N/zSihq3PN5a4ccp35UqOHPs8ZR97xsiJ8fJ338xOmTP6aDzeIIiY6TToUyr/WKhrNDQ
         /Yxg==
X-Forwarded-Encrypted: i=1; AJvYcCX9GVcPrFZQcb1HyMXxy8gaifkB0A/RTPRi1OEAMoyDZ7qANem4aItVfXzn1TxZJaJiRGifbSWPRISuU3Gllfde6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOrKqIhnWhB246xK8v35bJZkIB7NpAFv1EHi/sImIU9Lh9LuXI
	ZKYfXjp7lh6bJLdAk7PxSahPXN6MIh+osdoSDgDpFw1kQw5stB8rz5t4ysMUEkPo1TyeNWOUMtS
	nFRKdssWc+zzmtHNCw5TNPohE6ynuzns=
X-Gm-Gg: AZuq6aKUN38egy6WzPGsegMh/Etx2iE5S+JCai+L4RqFBil/BsiZhlmzoQwfXEZ+qOj
	JiuYSXB2JuQGov3ase93ZRX+syfxAvcSgzBPXoUcc9DmcyauXcEBVrgVwJeSAjhQky41580soGu
	0DeD30Bp/QgWR/6jpeNNKY3otDaHq9ACAVDoMnD6COfxUQHbpCRT93dyED1PF1X9uEUc3BqY1Ol
	ovNZ2/hhmghR7HfEf1/dYGMAvvlqKrKyDqeUSkE1zG9CcTFFnGC2oK10wG4dGBrUbighn44yTwy
	EACB1AgLWYf2YZiGLu7L1FNHMICV6jJufti4Rn+oa1488KKwnO1MMJOTV4Z+dHjxw8P0kq3yiV3
	6i4PHUOEjEClJkw==
X-Received: by 2002:a05:6000:400a:b0:431:2ff:128f with SMTP id
 ffacd0b85a97d-435b1ab836dmr4926768f8f.6.1769168375446; Fri, 23 Jan 2026
 03:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-4-john.madieu.xa@bp.renesas.com> <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
 <TY6PR01MB17377AE5807504FFB6594471AFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <TY6PR01MB1737738E302D0BA716AAA2650FF97A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <CAMuHMdXk6A2-isnLQCgrjjWRX=pYKbUvVz-nfDwy72i1qo1-rA@mail.gmail.com> <TY6PR01MB173770856BD4044A79150F6E8FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB173770856BD4044A79150F6E8FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 23 Jan 2026 11:39:09 +0000
X-Gm-Features: AZwV_Qi1ncDRUlLnXwWZ1l-P3_ht124RPLuPAwvq1Re_E8LiTcuyHXUL4gel0CA
Message-ID: <CA+V-a8uNpNPCyePQrRDQxaGfN2gZE3-2VvCMs3FOqFaU3mKjLw@mail.gmail.com>
Subject: Re: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off clocks
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: geert <geert@linux-m68k.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27322-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux-m68k.org,bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 5315A754FA
X-Rspamd-Action: no action

Hi John,

On Fri, Jan 23, 2026 at 11:29=E2=80=AFAM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
>
> Hi Geert,
>
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Thursday, January 22, 2026 5:29 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for
> > init_off clocks
> >
> > Hi John,
> >
> > On Thu, 22 Jan 2026 at 17:21, John Madieu <john.madieu.xa@bp.renesas.co=
m>
> > wrote:
> > > > From: John Madieu
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, 14 Jan
> > > > > 2026 at 16:36, John Madieu <john.madieu.xa@bp.renesas.com>
> > > > > wrote:
> > > > > > Some peripherals may be left enabled by the bootloader but
> > > > > > should be explicitly disabled by the kernel to ensure a known
> > initial state.
> > > > > > This is particularly important for PCIe which requires proper
> > > > > > initialization sequencing.
> > > > > >
> > > > > > Add new macros DEF_MOD_INIT_OFF() to declare module clocks that
> > > > > > should be turned off during CPG probe if found in the opposite
> > state.
> > > > > >
> > > > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > >
> > > > > Thanks for your patch!
> > > > >
> > > > > LGTM, so
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >
> > > > > However, I am still wondering if there are any possible bad side
> > > > > effects of disabling the PCIe clocks, e.g. when PCIe is in use
> > > > > (network card, SATA card, ...)?
> > > >
> > > > I'll test and let you know.
> > >
> > > I finally did the test, disabling the PCIe clocks while a WiFi module
> > > connected was performing pings. System got stuck, unusable until next
> > > reboot.
> > >
> > > Was that the kind of test you were expecting or did you have a
> > > specific scenario you can share.
> >
> > Not really. I was thinking about a scenario where the bootloader would
> > configure and use the PCIe device, then transfer control to Linux.
> >
>
> I can't answer to this exact scenario right now.
>
> The idea of these init_off was from the PCIe host HW manual,
> Explicitly requiring tuning the clock off and asserting the reset
> as part of its steps, while this is not the case for other IPs.
>
Can the PCIe driver not handle it? ie in the probe explicitly turn off
the clocks + assert reset + continue further (do you see any issue
while doing this from the PCIe driver)?

Cheers,
Prabhakar

