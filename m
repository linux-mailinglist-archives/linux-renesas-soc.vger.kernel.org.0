Return-Path: <linux-renesas-soc+bounces-15940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A010A88925
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 18:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8688B176466
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B0428468A;
	Mon, 14 Apr 2025 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J65Wwcpr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871982820BA;
	Mon, 14 Apr 2025 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649871; cv=none; b=PjKgsdtt7ss3IFfPATLr9Zdru2zzEHzL+4u2Stjv0pPTckF+9Ytb70MKyepgmh1wSTnTtXZj15vag3lkUbDb5NOVXfBxE1PbGqSKRSDdxT4WzbxsogcX0R3++8zuXX+57kQromKbyP7pHvomyihfU6EHrh1TQGjIdkUFoX/pHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649871; c=relaxed/simple;
	bh=R2UX98lIlNjDJ6qFh8FQiF/WtG61FPxjcw+Wg1sk41U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkR2bmlmdTNhAjEARapTJImNs0Z14G635q7inQY6mI51s5UpeDF61/2BkeVUS/8DrkaymCOvITOWTZejpCGM82/r/sZrQA5mDOwRlg9uhMetR04OfTbDtRjXUoLZUbKIfyYo381hCHTkbsWE66hDzfdCUr3hBEngbeRM1t2BDNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J65Wwcpr; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52446b21cfdso1939111e0c.1;
        Mon, 14 Apr 2025 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744649868; x=1745254668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drgJ4kvJBwLENN+wUSBbYOnp85UmFVhKGobYEXfoSwA=;
        b=J65WwcprbsOzEx+yLS/7tbNw/xcxBPxJAEtS0+y9mbtvpqjiyJmln++v+7OUrqPPHv
         qNjOkKaqyB0AK6y7P8GGR4EebwCtmdnlfIpgBz5JAfpnAkLf1djSmRJHGKilpQUzhVQD
         J5GymH7C/x0vdTgTmOtFTiOlH4chNZoT5RArSdJDg6juhnjg3w1V1z3OdC/Tu3776nh8
         +R094v9DM1qGTz8g0nEe8UwIb7a5Uotukq8+XBdJSnEB50zxRxNPooDh8ooNaMi9j3b4
         zGDcJq+Sd7b9amNJtztEg2H5Fm0uWFUR61rMVQ6Ofm6YmXErSHJaii11sHgtFh0K46JL
         aIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744649868; x=1745254668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drgJ4kvJBwLENN+wUSBbYOnp85UmFVhKGobYEXfoSwA=;
        b=e1lWSZnS7pfwGwNl/SYN/QidWrU8YDtXpW0fAxEj6wiaQxtTiUxoSoOKeHnnK3hosP
         Twby9/6PeyLI9lUkzZ0c/cF+TFnvhaQ0y1vdxavKO8798ed6o7y3bVqWGfk1WF4xlkII
         HdW/S3csHl89q+yGD70IeI/EZd1JMtSItfdbEUaJ4S9D6KaI6Y1U6FD+5XjxTEUXSLMJ
         Rzx0fKawBRsnLown5CUQhPe9W2Rh7Q2dAOYjKzLh5tA0pk9bGiDI9wVOz1qq4QNGPfqt
         RvFsNMhriVKS1z3y/jzP6/zP3ih+8dxRUlv/SsicFApJgFahWWFngdQOUWjdnoun0/ik
         sObQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRu03FPQHKcwSm1mDsjwNybk9L9VDiMKoil62vhR6/1Y53Rzr0Nyv2z8avxCsmFsXF60rE5y2mGZr2XpKL@vger.kernel.org, AJvYcCWF5E2+3kErDJhYXGYmPD/f0rLjROQcqkPVF5cdC0yYzYbKKP7WiP7xJICi8RDUHNPQjTSGjkzv@vger.kernel.org, AJvYcCWdogOKVQCmAGqZhP0zHNtycyRyYCKPZ+DfyakGKZjGd/32+Kc5Vf9kTBtr0xA08jZAYYhbGQK9PhV7PXeVGqfg53U=@vger.kernel.org, AJvYcCWq5wIF4mUB9LnjusC5XgcNzbp442FXtRZPW20xP3Nc1RbE5E3lw4eCbNOHk/mKfrENYqd2/xnil3pM@vger.kernel.org
X-Gm-Message-State: AOJu0YwdErd75ckYM1mZwjDOXyOY8cN0tIZ56u5aG20yHlEwKPqTGab4
	q1FiGXx0NeL6GHTb5IhadRg36G//H6lM5ciNQWyx6A1TyYJqk6vH2RseVC/3fze4OxEQVS3ZOG7
	/RGd0khpAlWthkFJj5tKA2JTzIgc=
X-Gm-Gg: ASbGncsoWu7bf2wdVTlaC0Jp6XnBxRxMetrOk4zt+B2e68nviIIUk/zMGJNUf8WjXoP
	bdpnLgRhkE6ERcoe5sPp4P7ET7zTel0xaUU4cIGyiqSpBjoyi5TfqtuwLKIaOsJAxtJpvO6wn4f
	hbdyVxUCpR7ajuj59yMLeRg5cXY5uZz2AlRIznkf89jMA3toNukOhjDw==
X-Google-Smtp-Source: AGHT+IEWyQ+qQ66o7N7+8XGJO5Ll56Mi7mVYoHXkbahGQ2VotD+EVhbg3G8216oUR9181f8bIK1PpfJpHPMEC84oVFU=
X-Received: by 2002:a05:6122:181d:b0:520:3536:feb5 with SMTP id
 71dfb90a1353d-527c3615240mr8335250e0c.11.1744649868304; Mon, 14 Apr 2025
 09:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk> <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
 <Z_0cPmY_LzI_fo4S@shell.armlinux.org.uk>
In-Reply-To: <Z_0cPmY_LzI_fo4S@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 17:57:22 +0100
X-Gm-Features: ATxdqUENKCwc-Lcqt2ec1N-RxZ-ERgWqw8teGlVULD-_8vGOd7AV27blrs1o4yg
Message-ID: <CA+V-a8t6AWzBBxmGG5J8-N0HCMpxYhUVO9m4FT0STGL9KPShVw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Mon, Apr 14, 2025 at 3:31=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Apr 07, 2025 at 07:07:49PM +0100, Lad, Prabhakar wrote:
> > On Mon, Apr 7, 2025 at 6:58=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > > > +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_d=
ata *plat_dat,
> > > > +                                       const char *name)
> > > > +{
> > > > +     for (unsigned int i =3D 0; i < plat_dat->num_clks; i++)
> > > > +             if (!strcmp(plat_dat->clks[i].id, name))
> > > > +                     return plat_dat->clks[i].clk;
> > > > +
> > > > +     return NULL;
> > > > +}
> > >
> > > In addition to Jakub's request, I'll ask that you hold off for a week
> > > because I have the following that I'd like to submit:
> > >
> > Ack, please add me in Cc while you post this patch.
>
> FYI, the patch was merged last Thursday, so please update to replace
> the above with stmmac_pltfr_find_clk() which will do this for you.
>
Thanks, I'll rebase my changes on top of it and send out v6.

Cheers,
Prabhakar

