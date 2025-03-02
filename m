Return-Path: <linux-renesas-soc+bounces-13871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED25A4B4B5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1321416A3CB
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 20:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5CE1EDA1B;
	Sun,  2 Mar 2025 20:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRB2mT3q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07F2033A;
	Sun,  2 Mar 2025 20:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740948129; cv=none; b=M7AlS14lOzgKQWUhOvHfwltenbqimrx21lFQ0DV1GjeYMdNxiBbKl2RoUBJuQBTyuLcTp3NElMdFv9WPFA4pHlIyE9t87EqTxMiSbnXNntTJRGohCyQAld4VXbZa9DnmmMrJrk3DwicWONcc7Q7Oi5Muur+oKCMbqC53ejnsRzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740948129; c=relaxed/simple;
	bh=8ek+3E25/WDKCG1eDsWVbtpNweae1sQM/k3cm/YTLfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L02Rw/OycFIrbkscGv9G9ww89K3efPhY294S5vfBcLn4wiuszH3n9ChPVN/dvIr5Ng9GQjcb53ti1yzi/iD8w6QDdl/wAk0Bdg1c34A5Jhp+LgRUvYjnVpKJ+6g9z0X9e1HdZUQ/KWPrFYGD6wDiYi8pATp1RLiZsoS+QdR2RI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRB2mT3q; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52361a772e7so2110976e0c.1;
        Sun, 02 Mar 2025 12:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740948125; x=1741552925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vwG3XWzx1oXEY5NJ5MaRENhhhKbU+wooyHo2x3jYFY=;
        b=lRB2mT3qzTZLAcok2Ck6u2eT6WJT3Lo+ZKQ2TmAEDONMogYRQVWQw1jkCKF3IDkVwt
         OKZn8LB7kSCwtWuMHvnQg0Bn/fYKWyhu2WcBVLy6lyPkbBQJ7puTpDvIZNgBmxyjOEY9
         wTCLeB5Q1nOYres+/bUVGKwPDGDPElurBrB2B4ZToCb1Fqx1JMxpodGKBmLUNQVFRKlV
         MVVW8ID8RU2nMIUGEU16iB1cynlUsFSWXe+oxfPgesYlWLezM6x9zCf+1kYrjoOswsB5
         y5QBqxRtfaOUVa1uYu7GxboideHwEjLTw5BtbKfE17yuDNV9DuV33ygRUsaPyyfnffIH
         88Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740948125; x=1741552925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vwG3XWzx1oXEY5NJ5MaRENhhhKbU+wooyHo2x3jYFY=;
        b=OA39YVIOX2YgP49cf1+5GcF9FStrJrAF4bm82rLY1/QPybQBVOmBgrGu60nS2uHr3D
         VQTLgHIrz/xTxoFlWE+4vamUbiONEXaQ/INyDSMPH9KhibksAZGsZ392cUvFO6d+Kbyr
         LeOqHyxM8WgJpJSgL652rug/yLJw+QKvveaCovmLzF+jz2b7NFG0RK+RUO6falKitZiB
         IFOEZMGxlCaJOiCDiY/HM+9Hq2inFk76lg53RjgSATMddAX3IFBLgFgG11WMtv0pWn1F
         oWZBemB7ufAtFdzs2xgF5JbCB0Ezex2nAIDegknunWr9nZZLzq6qJsVQA5WDRzCYN6U8
         /Djw==
X-Forwarded-Encrypted: i=1; AJvYcCUUiBFR3+HAP8KIGYvHuXLvXLAkD4YA0gfx7Ka63N6+Q+IyUga7T3ogzplocH2h/Xl2ZBsL9GJl@vger.kernel.org, AJvYcCUuckFt6x/Mlk+GCOsW33ijuukM1TpMrXo6c9qAacW24xk+k520IFtY0lRcykfGi8ZKDYyUAjbem0fHJydG@vger.kernel.org, AJvYcCWoOpbvrpHc919GTp0i7Na/DI3cmuARytpAgJorbMVInIqePjTkwlS0w5Qs74PWojlNGvzKnOvt0DfS@vger.kernel.org, AJvYcCXucMqtAvY9vH226jqITDIQKCmi4sfNizOvIeKTuTbpZb6gzvMWsy8uSAG2oMQsb43vaeO4/wZipR4qYME5Q0Ckn0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTMP8L+k7Ny24VwqymCCetYb9ri5sLmcf4vniGDVFwnE2kzMk+
	1V1QAy6mKZbFAByALTFHeqmyhgJ/y0ojveJ7Hz1aTo04jp6qVNOeK41SbXL+YQWt18Px4bUudSz
	czvRD9+pXijteW88U/FO67p2+4Bk=
X-Gm-Gg: ASbGncuBRT63XEQvXZcCvLd3l51yQgUgsnlzY0CX1PvlPxiitucU0iFjJDYwLzcTaNu
	m6Tu5Aylfj9jVU5etpZBmRebIfw4yiWoqvNEGnYyJar7EF+GpMevILfFdgXmg6RT4uaNBIZQr46
	nqB8dmPgIyIxP01AFOIRjXUkDJcw==
X-Google-Smtp-Source: AGHT+IHULVvVzy6eAlunOVty1COthJ1Jepa3LyHBbL5NNVzmQNI732/9q1C0CKv2xgLX+/1vQD8xyF5EmMq76ICjUXU=
X-Received: by 2002:a05:6122:8c01:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-52358de4ec8mr6748750e0c.0.1740948125174; Sun, 02 Mar 2025
 12:42:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <c5a75f20-9b61-448e-941b-1106cd06ea04@lunn.ch>
In-Reply-To: <c5a75f20-9b61-448e-941b-1106cd06ea04@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 2 Mar 2025 20:41:39 +0000
X-Gm-Features: AQ5f1JoWaBBZzpnBw9lvvBJNa6x5tpLyvwpF6S_ewU0TkWngdPMjjbvjmNy-gTg
Message-ID: <CA+V-a8sCMn+v5y5v9CyyV2VsRmLj-Uyowt61tTS9dWN43CD0_A@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: net: Document GBETH bindings for Renesas
 RZ/V2H(P) SoC
To: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Sun, Mar 2, 2025 at 7:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +  clock-names:
> > +    items:
> > +      - const: stmmaceth
> > +      - const: pclk
> > +      - const: ptp_ref
> > +      - const: tx
> > +      - const: rx
> > +      - const: tx-180
> > +      - const: rx-180
>
> As Russell said in an older thread, tx and tx-180 are effectively the
> same clock, but with an inverter added. You should be able to arrange
> the clock tree that if you enable tx, it also enables tx-180 as a
> parent/sibling relationship.
>
I can certainly do that, but not sure in the DT we will be describing
the HW correctly then. I'll have to hide *-180  clocks In the DT and
handle and turning on/off these clocks in the clock driver.

Currently
eth0: ethernet@15c30000 {
             compatible =3D "renesas,r9a09g057-gbeth", "renesas,rzv2h-gbeth=
",
                               "snps,dwmac-5.20";
             reg =3D <0 0x15c30000 0 0x10000>;
             interrupts =3D <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 767 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
                               <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
             interrupt-names =3D "macirq", "eth_wake_irq", "eth_lpi",
                                         "tx0", "tx1", "tx2", "tx3",
                                         "rx0", "rx1", "rx2", "rx3";
             clocks =3D  <&cpg CPG_MOD 0xbd>,
                            <&cpg CPG_MOD 0xbc>,
                            <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_PTP_REF_I>=
,
                            <&cpg CPG_MOD 0xb8>,
                            <&cpg CPG_MOD 0xb9>,
                            <&cpg CPG_MOD 0xba>,
                            <&cpg CPG_MOD 0xbb>;
             clock-names =3D "stmmaceth", "pclk", "ptp_ref",
                                "tx", "rx", "tx-180", "rx-180";
             resets =3D <&cpg 0xb0>;
             .....
};

Cheers,
Prabhakar

