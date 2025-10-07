Return-Path: <linux-renesas-soc+bounces-22772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3ABC2C73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 23:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 995B64E5475
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 21:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9332566E2;
	Tue,  7 Oct 2025 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDLgdLXV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CA31E3DCD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 21:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873290; cv=none; b=Q1g9lc37v2/+XmZ4oW6SBVpKGtXtt/7ko0nJcg9AhfVKii5J4wl53NzjhFvDPnpA5WrCuC9CbxniO20Fcxpve+acDK41I0Hg1avMATcBlO3bRVhvHPZmRDjgg0L7gZQC1sTS+w0ddJlC9K9qiUT6tH/I6NYVfDQmFn7PubkxGWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873290; c=relaxed/simple;
	bh=ySCbiURSDN5ZR0BnnCkPHTPC4nHlSKf1E9rqgJQMac0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsPcNK2JMJWokHaSwZpKsDDfmixnL17Lm57y89JK8koLXCuVLQM/cMy1IlsWEGDb9eIKaKVNLUVD8taGkvExWoe+QfPRg1K493DqpAnOT5X1tz4bNZkDceiqD0o1x0zSfF6BDIDfByg8Js/v3EI3dyJ/6ZnJdbKnNUym/Merq7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDLgdLXV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e4ad36541so72212895e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 14:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759873286; x=1760478086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySCbiURSDN5ZR0BnnCkPHTPC4nHlSKf1E9rqgJQMac0=;
        b=lDLgdLXVA/jzDydg/sT5Wljy0fPDwm+exTPyZ5vzsvWu5WKgyOcJI3k/ilQGhHpgMR
         0z85KjfusUDWOokAL7DOfEtT42HMLPOmV67qAmXuJo6NvdaPuZZvgRintKFLurbFYZCd
         gQb/igJJaU2sMWw++svSnPc/XZXM1efF2TMLggHZa47XfyHLXdJco47laJh9mTKfccz1
         kLGBm481+lO2MwDbChZ8sOXEb2+wx0uxdksXA8jja0bLectOIDMTVU1Q/Jo5pl+O0PVk
         xgYZ8YqZ87PFYMeXpBldze3cYH1vxeXRG9TYaEttKw+3bZ/myavdY1BGJghHMNFCYwQv
         Rj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873286; x=1760478086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySCbiURSDN5ZR0BnnCkPHTPC4nHlSKf1E9rqgJQMac0=;
        b=TkSrZM+k7WWjr6v/RiyZWOL8p0/EHqqkAmtGSiOenwZRmuL4WcSIO5VPRyc9gsmNbC
         sT0gLudbR04isDTibhcFODM1drUhuGSWJrdtxbmJjtj+1HrHaWP2k9rMSfbSuLFMDedw
         kmtuLfBqoK8NlNVW4ShmcswPyifkRrDWhMQ/EkDZWWkTgIoVbGc0lyj6+DuYPoecbbgT
         XPr8BP3Pka+NiPo4//8sT3yoL2c/ifhxIthKW0Vx89zsUifccj8wlXdV8ybztrXg9xCC
         KAVXb7clAWkk4mEnya/UHGjsAY4h6/rnY+G4SdKd00blZaiSFmfUOfUYrWWGHe1aFGUE
         RJLA==
X-Forwarded-Encrypted: i=1; AJvYcCWbzLIZkpmRwzfyoIZbB2vMP1EZNFG1QaKmgSILltLGzLJCb4g+0E+Qey7tPU4i5k129LzOGbVjgjoFtJ5htPXtTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCULO6RWX3d7bKNu3OhyP3ZsQDUVvhEO/KEd1j+LfrUrbOkWjx
	4+ihCorUAuotQWQu9XVpzv/UqjZoDtzbnJhgcNXOLLy5UociMfWEqw+8Hkwe6yDGw71VeBlRA2c
	1iCGi4uA/xDiqB6asD57sT/z26mj9ZnI=
X-Gm-Gg: ASbGncvcta+k/CrvoD72vYjC1SI71dXRuFWTVrhWATgcJTR04fXfgG8la6DNZtNNPym
	ZiCGfLKXR6ca2KzV5WgkzXeTJFb6oKAakape8coxO200rSkbiqWIx61RBPML5fw+YjEm6mqeHjN
	HZFLTCAQDURaTEKkIk6EYDwrmwuHhZONjN6w09cJBJRmWK5T8aVWqawFLfq/vdmk9FfcV06qMij
	xe9L33tXhPEfXTIE1+nO5R4Nsp/BFdFGvuCimKzB4cu9uvE/wPvr5LAXiom7Hi3apisItVegYg=
X-Google-Smtp-Source: AGHT+IEGGe8qqwvW24SEdYwXTYYiR9/8Ovszv40QtV6Uz0sZp4dA/iusTgbhW+5v1ezEliIHc/QmjsH7PtKEe5QYB4c=
X-Received: by 2002:a05:600c:4753:b0:46e:1d8d:cfb6 with SMTP id
 5b1f17b1804b1-46fa9af0621mr6629455e9.19.1759873285926; Tue, 07 Oct 2025
 14:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+V-a8tWytDVmsk-PK23e4gChXH0pMDR9cKc_xEO4WXpNtr3eA@mail.gmail.com>
 <dd6d8632-7102-4ebc-92e6-f566683f4a33@lunn.ch>
In-Reply-To: <dd6d8632-7102-4ebc-92e6-f566683f4a33@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 7 Oct 2025 22:40:59 +0100
X-Gm-Features: AS18NWBIGrpxoO92vBlA52qdgMqyrtCpNogEWZ9JBsHuN3slwVfjtPUrIuePow0
Message-ID: <CA+V-a8v89b0Mg8ZX6nabNV8bMEan3EkonVhhHCb4t1GNxaxqrg@mail.gmail.com>
Subject: Re: CPU stalls with CONFIG_PREEMPT_RT enabled on next-20251006
 (Renesas RZ/G2L & RZ/G3E)
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev <netdev@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Oct 7, 2025 at 7:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Oct 07, 2025 at 05:40:09PM +0100, Lad, Prabhakar wrote:
> > Hi All,
> >
> > With CONFIG_PREEMPT_RT enabled, I=E2=80=99m observing CPU stalls from t=
he Rx
> > path on two different drivers across Renesas platforms.
>
> Do you have lockdep/CONFIG_PROVE_LOCKING enabled? Is this a deadlock?
> Something else is already holding the lock?
>
I am using the ARM64 default defconfig with RT_PREEMPT enabled.

CONFIG_LOCKDEP_SUPPORT=3Dy
# CONFIG_PROVE_LOCKING is not set

I need to check if it's a deadlock, but from the looks of it does
definitely look like something is already holding the lock.

Cheers,
Prabhakar

