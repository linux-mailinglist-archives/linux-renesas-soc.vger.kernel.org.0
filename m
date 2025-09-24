Return-Path: <linux-renesas-soc+bounces-22325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0BB99F70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFBAF380EA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273A72FE050;
	Wed, 24 Sep 2025 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCMTcW8/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B852FE052
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719102; cv=none; b=a6Zx2vfimk6hoKn3w6+WealiTYBqNmwctD8nbJ+SNUzeVPqBgd8eobRLgA92W9+Y4Bug9LmCcH+OSZlnPYfv0zekhIeEZ2cYKM3JJ2KelqMiTb6Wmsfh4NYIGAptSE8uRb/SUqdBwlbGETs1TEaP0uvgBvAO0gh2albQBETYscg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719102; c=relaxed/simple;
	bh=KMWRTBxhzUrCLpchCiypHr9RXPN/vVczjD1fykuzDjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXrahj/+bi0NLXfoGaWIGYaewEzqWxwfMkN4IzyAqHUlItAAkyDCioa3oXsRuespGSoWIevdzWX0p65bRxKNqQZb61IvQfExIKvvdvXNn6UQqpzNkk+mZxmWTwSffIBmTKgoIPGz8iXq7ddjUq+T0y/oxvbPHjGkSriK9m78QF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCMTcW8/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f0efd84abso3771750b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758719100; x=1759323900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML8MT93NBaCozkqy3f5m8pHWK455oP1ORVjpuJLm5oc=;
        b=JCMTcW8/ThqqXZ2v1sJ7Sv+jMJCFLhAKsRkpIKIeQIJXo8qGHTEJkWCLpwmwc5R0uY
         GVtljqd3PmXKubL72WSIzqB35whCYQin+pDyaPoFn1BnVJKhUBiU6QBHi8CNpTH00n9W
         IijKyO/MFWpwgp9vJKaEqPZ32c+mM4Cf+d1Vf3uNbNMJXjYsqc+lOyEoFVyK3D/SePFf
         /MFGjQ9oKE/HmU4BzVJ7Ter8nolDFTqu++ZwA3Yr7aRrAvJyXBEHPWf1hVxmavcgfMac
         bpaR9sib2RtwbhRir8RQf6XUv7utYEG75TQfYUXX5Uyfo2T2P6zykxw75XownAneuRoT
         kl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719100; x=1759323900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML8MT93NBaCozkqy3f5m8pHWK455oP1ORVjpuJLm5oc=;
        b=q+o/u2GkbWzvNe86XpVUx55O8/f3VgwpSy6+IKKZsAu44e9Paewm0zLhQJEbhsJzyk
         x990DqA84ZzaxZBpzjnooMVZy3cGAzfKZuBeBZtbsTXJlSl9u928X0WAYpE6NedNR6Dd
         2Ob6pPxvZrqJRDjM293qX0+y5oBUdUfw54qLe5QwAfdQ+O+bkNrjhuGpHY1Y1RfJjqjX
         tSqNums7lYjBMw7uEVZy1/TX0lco1EqtAP+ig5LMPF98DUCKy+POAf8Ww37ZAwEp63iu
         07aS+86NG+72TfYdey4LpohBcdTKTHLFmSjjTAVFNXYQlb494IBQvJ8Z8Zwnwej3KscY
         ioPw==
X-Forwarded-Encrypted: i=1; AJvYcCV+gl7WKeA2GVymcIN1qqMIlkGYLCQ0/yFR1iUW6PmRvsxvvSdt4ZYXro6mcEzuz0kpPfiipeua0XFnYOZRIHu/Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMlznai26pz678CEM7JjXLNTbjk7eT82IegTlo+8IAhPoaC/m
	6bhG9r0gnklNdsZDaoHiCc2sOtLNLXLS2RaWVremfsULoCyXNMXYWHha4CvAmW06JMwZeC3VSqi
	vAc+jSjgTw5GWoV3zNknRDYAMcglu2Nc=
X-Gm-Gg: ASbGnctTU5BW2hTkTlvtnplsCwGZ/pKp7OpnneCr1OX10hzfSNNrDHAiPhyvWSQ8Agi
	q3ZnH9xgcdeATpXmqf4Pc/aMZscYrSkSDnHly9CkX1+NWLqkq6ymvEc97znQ4zYHK+/Qy5l8uJ3
	1kwsVJdZXP7P0v4XNIbcpKeuDjbYz6sTxJBycxiz8gh1pHmm995WHCKgRGEyG+jIHjvdCv+Usqs
	tZkyA6v
X-Google-Smtp-Source: AGHT+IGCUZlb7GHgT5j+JVNTpOON3z17rHhaJH8wYaV5Fzq+5A7QIaXDxQAJZsuGjTC053XYov/IrdtaNcnRVtX6QBE=
X-Received: by 2002:a05:6a20:6723:b0:2d5:e559:d241 with SMTP id
 adf61e73a8af0-2d5e559e089mr4875908637.7.1758719099609; Wed, 24 Sep 2025
 06:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
 <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch> <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
 <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au>
In-Reply-To: <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 24 Sep 2025 21:04:48 +0800
X-Gm-Features: AS18NWDPd9WPADUis1pKLRli7PBC0PtWHTmrvMja5YpnlZ2VdCkq5JfPN2APv_M
Message-ID: <CABh9gBcoWbXurPo0f9U9+gz8k6gttUvj=NMMDVfgjo5dgaTLSA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 10:47=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Thu, 2025-09-18 at 10:21 +0800, Kevin Tung wrote:
> > On Wed, Sep 17, 2025 at 11:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> w=
rote:
> > >
> > > On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> > > > Summary:
> > > > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > > > based on the AST2600 BMC.
> > > >
> > > > The Yosemite5 platform provides monitoring of voltages, power,
> > > > temperatures, and other critical parameters across the motherboard,
> > > > CXL board, E1.S expansion board, and NIC components. The BMC also
> > > > logs relevant events and performs appropriate system actions in
> > > > response to abnormal conditions.
> > > >
> > > > Kevin Tung (2):
> > > >   dt-bindings: arm: aspeed: add Meta Yosemite5 board
> > > >   ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
> > >
> > > The threading between your patches are broken? How did you send them?
> > > git send-email? b4 send?
> >
> > Yes, the threading is broken. I initially used git send-email, but for
> > some reason, only the cover letter was sent. I then sent the remaining
> > dt-bindings and DTS patches separately as a follow-up.
>
> I recommend using b4, it helps blunt some of the sharp edges of git-
> send-email.
>
> https://b4.docs.kernel.org/en/latest/
>
> Can you please send v2 of the series so that it's properly threaded,
> after applying tags you've collected for the involved patches, and
> checking your work with `make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-
> yosemite5.dtb`?
>
> Andrew

Sure! I have sent v2 of the series using b4, and the patches are now
properly threaded.
I also checked the work with `make CHECK_DTBS=3Dy
aspeed/aspeed-bmc-facebook- yosemite5.dtb`,
and the warnings that appear are not related to these patches.

Kevin

