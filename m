Return-Path: <linux-renesas-soc+bounces-21440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C31B6B45027
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 09:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91E191C82BA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 07:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6225126463A;
	Fri,  5 Sep 2025 07:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZFpwu3D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24EDF71;
	Fri,  5 Sep 2025 07:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757058245; cv=none; b=m2nXvpVOxyu0JGaN77K/1tSmJidqYLF+Ii6+vouOxMsJzSxCGKA/ZjStpY1G1cQov59vSHKvbQOKvGbAPRKJfqD2mbsxacorZnqqN6v70fNdCa+qZqgQH2xEyAvYouU1aUNCnsBUWMB1Y/bmFSgtpjSfWVNonAmGJqnsFo9r9sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757058245; c=relaxed/simple;
	bh=v0Goq8B6iu1BXms7r9OT3/94R7+63Lo0tNCLc694trQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhsITBvqoika/L39ojynBEeONjcVS6GqOZ//3Agu079SOwTmzUfaH8gW4VdaiTCQmldAunIt1b2GOCSap+UHlylj28RXsDjOvEq+RoyiYli3+6wl3qQiQiExGq3eYDzUWlO7fgFGtM8w+IeabftDoQ62APDYGvalqCdugtWw+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZFpwu3D; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b7c01a708so6815025e9.3;
        Fri, 05 Sep 2025 00:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757058241; x=1757663041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0Goq8B6iu1BXms7r9OT3/94R7+63Lo0tNCLc694trQ=;
        b=jZFpwu3Dihdon8Uyrl0upyVSkn9AT1QMKYGeevXc/so/Jqp2kFeo9LN2ue9yIGlbry
         9Kp00NIyj5x7+DSpSWZ3LM+fRzK10BxZ53AY99BnvnZCdqDQvSKv0Fe85wkv5EhEUxK7
         fVeNG/IeBRIKFx+WPd4UURF2SRbwphAsGupB9S6NwP5ZC+p/FeKLaULOsEX7npDLwI9f
         3pbJls3p+yN2oE2HioJlWfpQSlr/XqdgHBallc9HfqSVkm4y4CQigST4gHL0vCyRB7Zl
         /jDRRltTCcIm9WSz8aBFRqZDUAKlN8Jxe5vRFjnm5DKqHsvu6X8yk+YuxPMsDbjfMRcw
         Nxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058241; x=1757663041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0Goq8B6iu1BXms7r9OT3/94R7+63Lo0tNCLc694trQ=;
        b=Z3E3vnzSACv91RFe2qc9QmNwR1P9CaVlrZojE+2XyuFsDtrMv5Sc/7X8Ft2g0ZOzPE
         ygW/axfXiKUz45Lacb8Qs1JEFygW5APANFbazGpzpFeVMy7sI0izcrdPVx+Z5n7oepp3
         ZKHSYtQcavo0vAdkLtOrbhiJGA1pg7UX1AVz1udfaYSGMsN7ZqdQikdzlfSbQPOF/Npf
         /7YLzBD0zrB9Fa1cJkY1+U1CjcVhcYhvFLAEwpsdybpkbrGUhE03+bb7JhSJgCCqoNH0
         A1ilKMKjLvIc90/G6QMXrOfjTzzOGJpgeUssTf5KWCfAv9uw7korGK/bCSBWMvrNfZ9y
         /jww==
X-Forwarded-Encrypted: i=1; AJvYcCUE/CwgbWBXw3XpNLPRc/pYepJFtTPKqD9YQWW+7xgFQBHuShjIpZMj6uXHs6CE+SsCtyglr7/BYNLzLl11d6IjXCU=@vger.kernel.org, AJvYcCVvio+jqOoXbvj4xMXTUXvGVWKWxYeZeSxsiAF837uzW9JpocTNs6n9izuuBJC8eLyaLzC8T+SBAmVP@vger.kernel.org, AJvYcCXuMz6QC+fDyAX+0+Q35Ag5Df7qITzsM2d2uFwkIgm05htkPy8EwVuQdeGEH65lLB5E9t0OCba3S+5NeSOJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz79Rapr5SMRRh76a4xdPsjNWFMKlZxk4wcQabx2jCBFCVITofS
	q2Pdx5CcOyAZb3gwh3THNDjXLLEWChKZDfiobZ2/IByICgrH+VFRXySHOAuFp0vWdYrhvb049DU
	v422JvijaWdN4W0/4LrOG5D/OchgtSBM=
X-Gm-Gg: ASbGncuvatnfJgDab+PU12mj/LyRBtEGxR+/QgoCSGa2X3Oh0RHJaIq71np7L5KPwwf
	z+6RWFv1ZzXZbAAjA4DYKVm2EGnmqU9aQ8e4Rae2RUVLN+e8Y4XL9o1jPUXGrGBRnEXsC/70Kma
	utEtWBkYWAyfkCXlWgDbHGRDvtNvGtqVLUMIheO1nr3g1gsDSs2pASiNP5Y/UMpRAvLeNPknJjy
	PDlZr10KRCmMkZo2ZI=
X-Google-Smtp-Source: AGHT+IEs0sDk7Yw5ukuGeAfjlznKmlUqSEdvVHfRpyhiJhHksA9VkslDAzk+mIR7EIQjI7ZlLC80dl0edVxeg6AjH30=
X-Received: by 2002:a05:600c:3543:b0:45d:d9ca:9f8a with SMTP id
 5b1f17b1804b1-45dd9caa239mr7197005e9.27.1757058240685; Fri, 05 Sep 2025
 00:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLm5kbgRIcomBo6a@ninjato> <CA+V-a8t9VU4+Q6ofTYru2=OsrsfiSM53=rtvEzxoYmu_A0wwBg@mail.gmail.com>
 <aLnrV0VBVvQ-XB83@ninjato>
In-Reply-To: <aLnrV0VBVvQ-XB83@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Sep 2025 08:43:34 +0100
X-Gm-Features: Ac12FXwduyQu1SOO_ZjtWEAWUhY7RX1CzOvh8slh0GNzlEn65FN3TY8ypxCN7v0
Message-ID: <CA+V-a8tsoTt_543aUsABtrCWzvqxYUerRu-WzUuvZzvZ-cb0+Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Sep 4, 2025 at 8:41=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Yes with the P3T1085UK Arduino Shield Evaluation kit (logs can be found=
 at [0]).
>
> Cool. Since it reports two temperatures, it must be my modified version
> of the shield :)
>
Yes it is ;-)

Cheers,
Prabhakar

