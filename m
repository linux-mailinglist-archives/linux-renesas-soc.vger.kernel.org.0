Return-Path: <linux-renesas-soc+bounces-13945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A3A4D538
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 08:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD69818934EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 07:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879AA1F5429;
	Tue,  4 Mar 2025 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROzHeVnT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E208C1F6679;
	Tue,  4 Mar 2025 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074094; cv=none; b=ojBD7Iefx53LH7HjONrNakJ5HbsEc8OiqGynIJxvqhLZingABQCZJim+kicsjz7VUPw9H6sSCHnFCHt4f+GPePOFRBXPp6xHIjsSGCcXYHl9lY7o2llgD9ioDS9P8j7rKf1Wk4x7DkMJUXUxBxwDSrdkUajWv7t5L+bikKgeqbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074094; c=relaxed/simple;
	bh=42TYu4oQeWAKktlkMy/+5GJAWHHkWqbHXn93VmIIbi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AA6+Ja9WRr2HNGCzoPq1F99i+WQ+D/kOgeM8c4NM4O79OMcg7WpWOLsds0DI7UkI+xYZRKKQa0d2Mxj9H47u+wEs+d/cV9PY8RkNUfw9kDTb+AKBa3cdSLDK1An8d7q4i6mHdytXQHWK0+yPZEC+NA0U3PsnrJaOdbHmQdNTsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROzHeVnT; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5235d7f9599so1807239e0c.1;
        Mon, 03 Mar 2025 23:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741074092; x=1741678892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehAVBZiKRCcTorj/dGG/XHRPf74AjYxU8xRvstVVW14=;
        b=ROzHeVnTujMCWJ4V7AD68ceRj05GZnD28uup0eCznv+j8/MKf94cr0G2zVp175qk0k
         bBq+B/uzZ0seVGRSvJMzzUbJtuIK5xPUjFdjChQ3O28I59lVx7VE/cOxb34P4tUKx912
         gcAhm3ajvTclVUTlVRL6dF6QIwQszFRE7oCMqbuxSHLq3uTtLmhknc0M7OJrwg1DD1vC
         2q+JnaontoivfHat+A2unpZ7nr59Qlmk1gxWJTdiD/Ue1wTEkhtjc3px79/2MDBHvyJQ
         EG308SyWlW++/oBG324GyeinrlpLcbabXP3+7YkVDi7fmLkYnOy2jMVT1VTkplcPIkis
         PNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074092; x=1741678892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehAVBZiKRCcTorj/dGG/XHRPf74AjYxU8xRvstVVW14=;
        b=a8aXbt4j1w89adqLZ+6pezaC+jrw7L2yqpYzwJvv/4qXFG9W4IGoEBYD5bXTKnc7zp
         G7inRKOyuPDnzgSxQfdfA15Y9qqh+4T5F6bvNobPj38Mp8otJ+JGu9sRSysbbUM6R6rp
         AzJh32O3/JVm2KmwzeaJbXmzfRq4A7xmt6rfCj4Q1CDoXS7unT8sILFsnGeezuTkfpJM
         rlrSvMXH1AF7qVguitUUXSX7IbK9Glxx8npqdzMBnbois1P/YyOkRSadBOq9/7APYUC6
         jySIDs3FI3PnIq2lJ/GY1UEanH1RXXwt7EF9XDyhbv5u8xL/fwcHaDUcltnY/MUVoiuV
         1k3A==
X-Forwarded-Encrypted: i=1; AJvYcCUwjMFH+pkIfUMWt2ufLuILyoT1MDEE2++n+eXWlvX9l38X+1uPxa7ZG2/KfuhVqkNIvWMvNq0Q7S9F3nw=@vger.kernel.org, AJvYcCVfjqMaCCFfgp88Uc2Os4xkI1FaFWCtGP8MzD4enRqXmO4KBJ4Xkwi2C04yY7gChA+dXqczg0jfYDhZV2FJxGEgriM=@vger.kernel.org, AJvYcCWxU0s5e0nmVSEqtCLLc1gpbJZBEr/Ra0x3dlfpOYUOymmblokKnFHjHoUfdqtOrpkr9b+n7mIb@vger.kernel.org
X-Gm-Message-State: AOJu0YwgiQelDz6Xw/7RRzNrwFts0D4naeyl0mu1LztoGsgi5J1Lci2j
	FTqgoNi1Oo8MuMMRy2Od400vmiVeRMAuPnlXh/EPf6tJotJsv4FwFFaKpX9+G0hkpEAI36Xlkrx
	HLcfR727LOZbsUtETAxzIS8kDsLc=
X-Gm-Gg: ASbGncvRGvsDGAL67wRLiIKz28KbnVxFIiRgKpOgIsYYEJeBTS6McL5hjnkaLnVYO1q
	LGhJ5TmzhTRyugjcAA6t/EgcXXqxDSqvE7iyjtlnqVonQKgInP9+9omBsyCC6cmNBuTIoMXlmAe
	5AmOgXeW4F7H/5FyX+mMx0/TBctg==
X-Google-Smtp-Source: AGHT+IGzl19ZwYyuOur1HDSOzm4Fn2GxpdVR/SulPoBBGwex5tdesWntt/9GvppHS1k1Qx+c6y3kEzRIKhGxwY4aDD0=
X-Received: by 2002:a05:6122:1b8d:b0:50d:a31c:678c with SMTP id
 71dfb90a1353d-5235b7e186cmr9987997e0c.2.1741074091599; Mon, 03 Mar 2025
 23:41:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303190841.179890-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346BEF0C5C45C9EC6B3D3B586C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346BEF0C5C45C9EC6B3D3B586C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Mar 2025 07:41:04 +0000
X-Gm-Features: AQ5f1JpTkRcFMLmhBGcMNg_LIMp0NmjGG85q2_4qbfN8T5KnbQj34djf0J6nuj8
Message-ID: <CA+V-a8t8o92C4OYac4xXxS7quieNZWWPJxoT2dsrZ0M0AmWW-A@mail.gmail.com>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: Correct reset status check
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the review.

On Tue, Mar 4, 2025 at 6:43=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 03 March 2025 19:09
> > Subject: [PATCH] reset: rzg2l-usbphy-ctrl: Correct reset status check
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Ensure the reset status check explicitly evaluates whether all bits in =
`port_mask` are set. Replace
> > the double negation (`!!`) with an equality check to prevent incorrect =
interpretation of partial bit
> > matches as an asserted reset.
> >
> > Fixes: bee08559701f ("reset: renesas: Add RZ/G2L usbphy control driver"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/re=
set-rzg2l-usbphy-ctrl.c
> > index 8a7f167e405e..6451f621e862 100644
> > --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> > +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> > @@ -88,7 +88,7 @@ static int rzg2l_usbphy_ctrl_status(struct reset_cont=
roller_dev *rcdev,
> >
> >       port_mask =3D id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
> >
> > -     return !!(readl(priv->base + RESET) & port_mask);
> > +     return (readl(priv->base + RESET) & port_mask) =3D=3D port_mask;
>
>
> As per the hardware manual, these status bit is valid only when
> Only when sel_pxreset=3D1.
>
> If sel_pxreset=3D0, we are reporting invalid status to the caller.
>
> Maybe we should check sel_pxreset while setting it and read it back to
> Ensure that it is set to 1 and in this function just check for
> phyrst_x bit for reporting status
>
Ok, I will update it as above and send a v2.

Cheers,
Prabhakar

