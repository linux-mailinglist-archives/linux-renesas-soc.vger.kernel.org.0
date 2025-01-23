Return-Path: <linux-renesas-soc+bounces-12406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACCA1A7DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1EC13ACCE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC0720F98E;
	Thu, 23 Jan 2025 16:31:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D706F06B;
	Thu, 23 Jan 2025 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649861; cv=none; b=SQvHdTQeFZRAylr5GRudOOMRFztfbf6PKn3YJjDarFMWTvwRDlsL3FOmYiHTC4qWFY1XhQs8Wf/EK1oo76rk5jPDFA31+g1xq1fiXW6FuupNc5uvnnCYxZKTReIGQoRDPmSMpD3QNippgnfpEsz47ynVrsOuVMeoCLbnCLP2/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649861; c=relaxed/simple;
	bh=TFHZkEM/UzLg9lVrLrwQttO1Rk/ZerNID+Xmd1Hlvb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvZhtj1Y/2TefuE3ZUoZTpXpeX5BM/11sSD4ivc2Iu0wuLWnoX4rpBHP2g0t19ypMYr95x0lF3i6Myv+mbcxXH4YhspU0rYl+0LKmO6lDXyM7VvDPntzT43m7br8zh9H6R7vMElLLSJ9RxdZ2aEdPO+KcvK9Satx2MSJq+6dMac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6edb82f85so146944085a.3;
        Thu, 23 Jan 2025 08:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737649857; x=1738254657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OOZAk573KBIPXdQ0sttl1zQn0JOhz1RA0dJ6LznH6g=;
        b=cIuPNJxnLvpsjA8+9DDNg1w2mWOOuWEvMInVJgtXHWDm34mwQPL9Rab3vLcPElQuMw
         wr7WE80YNnuBJdKKjrl3+uJNkRpUoUbKXi0qmBzU/0CLYPuOBIwV3a3pn7LfADgExPsO
         +gc/nf/qQmYWblK+x1zCbVKESIP4JUkFgGYNhjdO99EsgCPmf9j9tBRaOcPLQumIDjdH
         +1YOMYC4WMo3ULcXSMJcIZIeh2TPimdCtK9bPFoBg7QOjJD4qhDYOHbmTAibDgMbr4XG
         5d7b8HBbkQrpUaoxVHD6sBVm/5R+jK3zr1cxmgZeTTar0aegfmLUAKQuTFQudWziLQJ5
         MBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQo2knyXltq7WAmaDMHfImeQpw+/V5HXEz6Hnk2G+4Duecgt3czu183HxjZR5zCiTLwh0PJv7V2VL6@vger.kernel.org, AJvYcCXkey8PquiqIHojH2eRMAaNDcnkvvsx6iRtHrLTdm2+UdMS90IUvyxZ65HlyExNHIYAQ7fNJDn16RfGFK1hZF4iAfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQHxTtSQT7SLu+ze/KUwD6lUgyOEuzOw/wbe0E5BN8OrNr8TO
	4jb9unw3He4abMZhVern5+e4udcVWNGxxM7BL9nOy8Is+3HFNBoQOuIpnhru
X-Gm-Gg: ASbGncvwYo3FEnanRPIxn1OuNrThKuXpmHzHW8o4f7/BjCdLjfj2Ssy4EBg35IgC41l
	iBrABfqEa8UEy7Df961aIg1U+8mKhm7ddPRBUfpwjT/u4UsSkxmb9BzaIZolVB0KoQcoyck+dE+
	1dBFPC+05eKDlXb2TU6QjuhMzpbrr8fbJ0eo/JMjabggG0EaZRDcMqv4F4aUR4l3RMI92W5XdBQ
	DI5p8R/NNxLAzVXdVzUnLdtrqXlQkAFp0Mb4SfYCUXneMJT0a643ePP2B8i9kjvVmWSGv56/vP4
	xol2E9tTrou3w8l3/4a62BmcGrrIVqKxz2+xFdh7C1F7jw4=
X-Google-Smtp-Source: AGHT+IGqpWj9WTrj/iLF5A2zIc6pvdooNlu755TDUSFngDxAlbuRchsBA4irMPCyMCPDHeZ+M3vhew==
X-Received: by 2002:a05:620a:24c8:b0:7b6:eab3:cdd1 with SMTP id af79cd13be357-7be6325dc77mr4718736285a.49.1737649857632;
        Thu, 23 Jan 2025 08:30:57 -0800 (PST)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9aef14b9sm297385a.73.2025.01.23.08.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 08:30:57 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-467918c35easo16441571cf.2;
        Thu, 23 Jan 2025 08:30:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUQzB4/7Jnv1TiErRFFc7EuwFhZrN7Bik+s23nsGbdwvUz6wMQi00YfShYHB+ZeGOEz+7Wclziz/PzXdgA+0pjEVM=@vger.kernel.org, AJvYcCX5rTrXvatKQ3AJkqebmQOe9txYGPbHIGZMD21ZBQx9hv8IO5wi35xjSFTYzFMkDtP8cvdIfGrAFlov@vger.kernel.org
X-Received: by 2002:a05:622a:47:b0:467:5d0b:c750 with SMTP id
 d75a77b69052e-46e12a690e0mr384445131cf.22.1737649857108; Thu, 23 Jan 2025
 08:30:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com> <61d3d9c1-cb43-4b29-81e2-1c6f189191d0@mailbox.org>
In-Reply-To: <61d3d9c1-cb43-4b29-81e2-1c6f189191d0@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 17:30:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCEshShnrNgxcLy1ii=OKt957aofEKm-1NRdzwMQ1p_w@mail.gmail.com>
X-Gm-Features: AWEUYZnhg-6RrWKZLzBa-_4Pv7SVHAFC90S4-tDaNOpf85kbrAi3FkAdF0fGMVI
Message-ID: <CAMuHMdUCEshShnrNgxcLy1ii=OKt957aofEKm-1NRdzwMQ1p_w@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch ports
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Thu, Jan 23, 2025 at 5:20=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
> On 1/23/25 4:25 PM, Geert Uytterhoeven wrote:
> > On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Introduce labels for each rswitch port in the form 'rswitchportN'.
> >> Those can be used to access rswitch port nodes directly, which is
> >> going to be useful in reducing DT indentation slightly as well as
> >> in DT /aliases node to reference the rswitch ports as ethernetN
> >> interfaces. No functional change.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v6.15.
> >
> >> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> >> @@ -974,15 +974,15 @@ ethernet-ports {
> >>                                  #address-cells =3D <1>;
> >>                                  #size-cells =3D <0>;
> >>
> >> -                               port@0 {
> >> +                               rswitchport0: port@0 {
> >>                                          reg =3D <0>;
> >>                                          phys =3D <&eth_serdes 0>;
> >>                                  };
> >> -                               port@1 {
> >> +                               rswitchport1: port@1 {
> >>                                          reg =3D <1>;
> >>                                          phys =3D <&eth_serdes 1>;
> >>                                  };
> >> -                               port@2 {
> >> +                               rswitchport2: port@2 {
> >>                                          reg =3D <2>;
> >>                                          phys =3D <&eth_serdes 2>;
> >>                                  };
> >
> > Would you mind if I would change all rswitchportN to rswitch_portN
> > while applying, for consistency with other Renesas DTS files?
>
> Go ahead, but also keep the commit messages in sync .

Sure ;-)

> I can send a V2 too ?

No need for that, as I already made these changes locally.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

