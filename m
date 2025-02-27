Return-Path: <linux-renesas-soc+bounces-13750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A32A478BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 10:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1031885B3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 09:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E809A227B8E;
	Thu, 27 Feb 2025 09:11:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C6E15DBB3;
	Thu, 27 Feb 2025 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647492; cv=none; b=iCYqEBldOb4TEnDh8f5KIcrrh7/nMRpZnHLqBRqr/OdJGi0v4/1zHFah0PvxrCmTJbfevsQVTYnG0LIUuTApcungYJlhP7DWnwD3lImMmPBkiaAzwPZOSTCAQEO8RR7JqfXiHLLdCHFym2/21k3z8tPZHm/Z5eS1CAZoSWR2s+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647492; c=relaxed/simple;
	bh=LR6jK8VXuLAnV44248xIvZulX6e5U7/HOijDfqpCCxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G59XMg9JwhaIyguSfswt4WpomoOOWOqVHLBm1bkHWa3OoIEG721eiCMHZYU1UwGf6g0ds02zPCXRe4z1CuIj5IFT5XhryR2OH2bKAoNvacLxnlCppjIgp/7KBNUJ/WLFLqt3JC5HY8wW8t8TAr4OmTL8g01Gi37h6U91VH2Tf6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5209962eefbso1381796e0c.1;
        Thu, 27 Feb 2025 01:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647488; x=1741252288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYWgKNxTRqestiJejTHgE45BLxqTKFi1UYZCuNAfrVA=;
        b=UEmVhiU6RFE4EUvZMNqy7Jz0uD2WQo2fK95hq5yijCzitm6x2K5+Hhq/eTdWiSqYvU
         p9lpHDLXI2qJA2hKi8OQ7+fhnUvbs/9hhrXDG4vJp2x25te7oa5yKTlY1xWsZP7/7XCJ
         bham5DDLRYTdkuZqA1q/IBzLwI0NW65CvIqJZ2JkO6AZuwgNJffzTeFXkbC9+bFxsmPh
         rPuem8tOJw+edRaJON5Nvc6pfgKkkzDN9c3IXuHgyIxicQURkoiG64+amSLtilQkXd9J
         uw7dCo+GwJ+W8XVdsJFyNBYT24prMORQGec93z71K2htO4yRDanQstX4nuEw7Rc2GSWa
         L8Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUOXEekwBP0GB5nGWo+RmTthAP8LUcqJnRxY0LN0vDKMxcLSmz7CbaL+IRF6euiIOaBJUG7Cd9aoKxB@vger.kernel.org, AJvYcCV1rtoQfexrq2k7TuL2AIuXyAK6O0cDBtpbyUiQD7tyKbRlwbVnVBY5J/3IF+pT+sa2BRNOP0MrLRV1@vger.kernel.org, AJvYcCVR1duMYXIuWgj/CD7JYk3rTfZlfJeS8SXIjBRF7Vc8zDffiCaRfbxagxrztv8N0va/EHGnBt5lPieo14fS@vger.kernel.org, AJvYcCW1LT/m3nxonYc66mOJz9UkoVpNi85qOjHOU58bViCU0mZftK+fRGje524bB7ssyJBhgxrqu5H3OMMGEXvfv2PY2Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzJIkt/zdPaZtELFS6qhyGrs9YmywMBorAVUifZSIe3E1Ih+Ty
	c1Jfx/hCa4heWetVh3L1/TpK6cO4dbIhVgJXFxDiPf+kofCyWT+5k9C0emwr
X-Gm-Gg: ASbGncsEbe5USzTKK8FZuwt5RZAa2CElFyuIua9EvUj/PXDf2TeHI9V/f8w5DmSNwqQ
	+Tolxsr9Wm8n9I/OEAWbs1AbLCZV2YRiAqtUI3gDKdLk2/MB9EZtOBbiD8OikYb4tT/Ij7JbtZ0
	NLzbQeYAZLrNRW3qGyyZKkP6/hiNFHNsbLWo2bpzOkPDB9Z884dF78B2Joa7Cz4U0pbwEZvQaIR
	xllmHP8kP7JVjrVhc1vPZaiCF8swjvvrCp56o07ScB5PKc4FfEtmS9CI7YtvI7nSwVNfRm3P7nf
	hpix6SsjItPfQPlibpvaq4ia+kAYXti38jIXRDWHICsMXhYxCHcVYwaqX32L0RUR
X-Google-Smtp-Source: AGHT+IHjFSvvSb5W0P+ckgQLklto5qs5yF7rAJI2MHzk6nNpqg8VUIza6BzB1117jZjfQDSK8rMf0g==
X-Received: by 2002:a05:6122:3718:b0:518:8753:34b0 with SMTP id 71dfb90a1353d-523496045cbmr1142334e0c.4.1740647488357;
        Thu, 27 Feb 2025 01:11:28 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5234bf3dc22sm161556e0c.22.2025.02.27.01.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 01:11:27 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86718541914so1287409241.1;
        Thu, 27 Feb 2025 01:11:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3GUCfsU1rhWnAeZKK53UZhpJaGsRh7XVUKDo2uzOkJGokCK6F1NBcOq59XouCuSyLB4YcIk2/NPxP@vger.kernel.org, AJvYcCVDJEMTkKUe9tQ2jtZL/bqHR1K10oF4D/5439sW5RtoeffD0GeqbFCf7SFtKylJp8r19ETct60qTgPq@vger.kernel.org, AJvYcCVumTQ31KtC8XW/glAXxT4xOx2TX/3NbD6bHlCaOZUJXmHJxYlbODi+MEuanz8TMCayRrqN6baGdGu3lODBiz/iM+8=@vger.kernel.org, AJvYcCWFFLHkV0fE+Kzpm4aBQnPZq08Vxk5ih6LupW3lYMNUNMSvKueqEmqNlBljTrRjw2wvZp9KEGznMA/uXp2T@vger.kernel.org
X-Received: by 2002:a67:f918:0:b0:4be:5b97:ea09 with SMTP id
 ada2fe7eead31-4c030fc1744mr1059127137.1.1740647486985; Thu, 27 Feb 2025
 01:11:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
 <20250220152640.49010-4-john.madieu.xa@bp.renesas.com> <20250220191718.GA3642117-robh@kernel.org>
 <OSBPR01MB27752329B962BAC78F341440FFC22@OSBPR01MB2775.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB27752329B962BAC78F341440FFC22@OSBPR01MB2775.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 10:11:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_HrPiw_Fh2KS8A0_=sJ=c4RrxTBWomp8HpRSEMXLeAA@mail.gmail.com>
X-Gm-Features: AQ5f1JrZ1TmGU8kkjrrEVIZPy-nw18PciO6X-3mzPsMwnndLE435TcVwPq4SZfQ
Message-ID: <CAMuHMdU_HrPiw_Fh2KS8A0_=sJ=c4RrxTBWomp8HpRSEMXLeAA@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"rui.zhang@intel.com" <rui.zhang@intel.com>, 
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "lukasz.luba@arm.com" <lukasz.luba@arm.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"john.madieu@gmail.com" <john.madieu@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 26 Feb 2025 at 16:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Thursday, February 20, 2025 8:17 PM
> > Subject: Re: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
> > TSU unit
> >
> > On Thu, Feb 20, 2025 at 04:26:08PM +0100, John Madieu wrote:
> > > The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block
> > > designed to measure the junction temperature. The device provides
> > > real-time temperature measurements for thermal management, utilizing a
> > > single dedicated channel (channel 1) for temperature sensing.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > ---
> > >  .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++++
> > >  1 file changed, 123 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > > b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > > new file mode 100644
> > > index 000000000000..dbd3860a31d0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.
> > > +++ yaml

> > > +  interrupts:
> > > +    description: |
> > > +      Interrupt specifiers for the TSU:
> > > +      - S12TSUADI1: Conversion complete interrupt signal (pulse)
> > > +      - S12TSUADCMPI1: Comparison result interrupt signal (level)
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: S12TSUADI1
> > > +      - const: S12TSUADCMPI1
> >
> > Odd names for the interrupts... 'S12TSUAD' is the same for both, so that
> > part is redundant from my perspective. I guess if these strings are
> > meaningful for anyone familiar with this h/w, then it's fine.
>
> These names come from HW manual. I can change them into "conv"
> (for conversion complete irq)  and "cmp" (for comparison
> complete irq). What do you think ?

These are the names from the point of view of the interrupt controller
(Section 4.6 Interrupt Controller Table 4.6-24 List of Input Events).
The silly "1" suffix does seem have a meaning here, as S12TSUADI0
seems to be a DMAC request signal...

For the TSU bindings, we want the names from the point of view of the
TSU.  Section 7.11 Temperature Sensor Unit (TSU) Table 7.11-3 List
of Internal I/O Pins lists:
  - S12TSUADI: Conversion complete interrupt signal (pulse)
  - S12TSUADCMPI: Comparison result interrupt signal (level)

So I'd go for "adi" and "adcmpi".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

