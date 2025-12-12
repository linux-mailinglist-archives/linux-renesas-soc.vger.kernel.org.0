Return-Path: <linux-renesas-soc+bounces-25711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EECCB8A8B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 11:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBF013053299
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 10:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48BA31986F;
	Fri, 12 Dec 2025 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvgDn2ys"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB98319608
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Dec 2025 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765537120; cv=none; b=rWhAeH5TLVUj6ixazRCOfytUApmLMq5vCZOMka2EuOwSqfImOtH+Hnm9vNa7Y68EO75bxr75JxIntfgrpsRLkz+VT/8QXqYIJX0pSlYFqkl+bW165KNolH3dOJpRSFoC8R4dITBw4hdohoodCVTaW7abhQLHL0DWCOprqUbDNDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765537120; c=relaxed/simple;
	bh=WqXxoSqrDnwsvdO/PSfoKvUqgPvzTsDKzE39KogF71s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEuXWilwJHLHw6thfGYpcKKhdnvHsa6nXQuFQHYHuRmOsmzeJ+xbDptXoWVyjVrptxh8lTMFtQfNKaYJt+CNAnrpUyUs1RX4Pg74CplzwqtloHtO97EXeIkPArsRRWrnpbn1FmYrNbkEgovp2DQqUVcd6SgjKr2SfJp8EFS60uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvgDn2ys; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so8765575e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Dec 2025 02:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765537117; x=1766141917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqR+IQTeub3ZkC8GS6Wk65+OamU6y/VpkmKlXNe7HxQ=;
        b=lvgDn2ysJzd39XPqVSstpGi+diianBQxBqw6zBAmxTHcLYzASsB+DmCYp1eD2GeaWX
         z/5vK+XhzkDmVaxIqK/IaoqPPcuC1wxB8Wmi61huhdFulcrj7rYJ+fUhpcC6/zEq2tCf
         EdDOWbAVbT2bVA7x1K/R79OGoz5Qg51+ojBpTi+R/PP8rd1g07yu1/zzUuXPSdiJ7eyw
         UZPx8+fpJyLtWfoghz9zk8o1GSnVx4gXdbtn54v1dtl3YH5i2jd0Ua8CDa2CVhlB0+NF
         wB8Ge06OxeYpywcbcXSqd+jJWeNGGJqMnrL5MH+QenmgwWWGF8hDHODj0TSx2DfhXWG8
         10UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765537117; x=1766141917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HqR+IQTeub3ZkC8GS6Wk65+OamU6y/VpkmKlXNe7HxQ=;
        b=kRRHEmwcyHGzo5yV4QYt33LV3MhKabNS1PG7TpSikHFNp9a3CD7aPhHf6Q9Fqzd/Gw
         iDBaRavYG5C7p4b0TUrQND+3JhROBSSuaewFEnL6/y1PELrBAkgY3ed5cw+ELmkik/i5
         pBy/fwZKIRcY6/u8trFCprq4qi/T0ushVmNnljDU8W3w55y86u29H6CSfAGJym/qQ6w+
         /UAdDgJnNI9E34qwqMXEpAsOKGLSqg1dUBMl/3vboEDWrOJdCa3pCYbbHMhGjPyWMuX1
         qtOKb5kGswAer0nYy6nJuo0Nwgxe6+5WbtCCxHHqAwrqszdqFzarFQwil2Q6Z41ehDsE
         4nwg==
X-Forwarded-Encrypted: i=1; AJvYcCUKhQAPLWNRuigbBPj7zZj4uGw/3W66WnZ22m/+4sqqWM03pgZzwzHqgASL13DlrFy/m/wEiKp2YBQAp/hRBlDJRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWpNnRbwtAapZs71JCMTNx8zalPPMrNzOqA1SM48sWoDzikf2
	q6+LMvCjn9bCAg++3xpEFiSZq/QK5rEqIRy2k0ZgKSvJFl4QU02il+DuE7cvZ9wJms93NntGUuX
	oA9+RDFP7pW9ZA+KUBZQR9cZXnnBiiO4=
X-Gm-Gg: AY/fxX431O6lORoTnfQ7omF9NMOzlX+4Iq6S54GuDOIOoHx59yoPZond/4MVUlAgPPa
	rlpLGWiK6+itJZMpuVBUMRH66fZCafS7ASQckjO0hAAqVRu5orLI3kKByf7euXJsvreStcWC0BT
	Yli78BtmuQKttOtjkbMAmXiGstqQAJGd9T/yvOsXBOLvJyJLz0aTu8Y0amWvKFVvz8ziyOc8HZV
	1r9Z1uj94I40wf+bDZf978qnv3Isjq2IXmTnjBvkFccrOTl7k1QGMJncKto1a+Jx2WnPg3uIweD
	wveaU+6zDOJVZNRu3LWzVySWrUc=
X-Google-Smtp-Source: AGHT+IE+ahrc04Q/jrdoppQwasQ4J1Y0Y9w6+KHjcQu1lJlaMpy7m90wwcJKrOJXxvNDcByIW5d1baSzOlJ31jhyAq4=
X-Received: by 2002:a05:6000:186d:b0:3eb:c276:a347 with SMTP id
 ffacd0b85a97d-42fb42bb935mr1529919f8f.0.1765537117044; Fri, 12 Dec 2025
 02:58:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209162119.2038313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251210-mauve-cow-of-hurricane-0f969d-mkl@pengutronix.de> <20251210-persuaded-rewire-8ac93b0cc039@spud>
In-Reply-To: <20251210-persuaded-rewire-8ac93b0cc039@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Dec 2025 10:58:11 +0000
X-Gm-Features: AQt7F2qVBwHpP3VeypyTa021PRhJeO9lvQ2ybqJTDVdXUznY1gpLQoN1_DLtzFc
Message-ID: <CA+V-a8sUPin=r=x6TVvyazqxwfDwW+RsnOfHaTJf1N-VpAPE7g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: phy: ti,tcan104x-can: Document TI TCAN1046
To: Conor Dooley <conor@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aswath Govindraju <a-govindraju@ti.com>, Frank Li <Frank.li@nxp.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Wed, Dec 10, 2025 at 6:21=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Dec 10, 2025 at 08:52:58AM +0100, Marc Kleine-Budde wrote:
> > On 09.12.2025 16:21:19, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document the TI TCAN1046 automotive CAN transceiver. The TCAN1046 is =
a
> > > dual high-speed CAN transceiver with sleep-mode support and no EN pin=
,
> > > mirroring the behaviour of the NXP TJA1048, which also provides dual
> > > channels and STB1/2 sleep-control lines.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > TCAN 1046, https://www.ti.com/lit/ds/symlink/tcan1046v-q1.pdf?ts=3D17=
65297159307&ref_url=3Dhttps%253A%252F%252Fwww.ti.com%252Fproduct%252FTCAN10=
46V-Q1
> > > NXP TJA1048, https://www.nxp.com/docs/en/data-sheet/TJA1048.pdf
> >
> > The polarity of the standby line of the chips is different.
> >
> > You must set the correct active high/low property for the GPIO, as the
> > driver uses logical levels.
> >
> > Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
>
> What you're saying seems to contradict the tag you've given, is a
> fallback really suitable if the standby polarity is not the same?
>
On the RZ/V2H I have,

    can_phy: can-phy {
        compatible =3D "ti,tcan1046", "nxp,tja1048";
        max-bitrate =3D <8000000>;
        #phy-cells =3D <1>;
        status =3D "okay";
        standby-gpios =3D <&pinctrl RZV2H_GPIO(7, 0) GPIO_ACTIVE_HIGH>,
                                  <&pinctrl RZV2H_GPIO(7, 2) GPIO_ACTIVE_HI=
GH>;
    };

When the CAN interface is brought up 0 is written to GPIO which brings
the CAN transceiver to Normal mode  and when the CAN chip is brought
down `1` is written to GPIO and it puts the CAN transceiver to Standby
mode. Which matches to the behaviour of TCAN1046 CAN transceiver. Am I
missing something?

Cheers,
Prabhakar

