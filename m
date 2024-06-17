Return-Path: <linux-renesas-soc+bounces-6353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB43D90B382
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 17:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59862285C95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 15:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6492915382F;
	Mon, 17 Jun 2024 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZ1StWvr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964AA15381F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634288; cv=none; b=XIHh578z5/QQ3eREZNDgh2RJKeWUbRIZJJM+aQoG92hm/AwhvtvhAOb31zbaaltV6ArRn3dlhgvg5Ebof0DA/sgTyiKiRrDes2+TfDOgiprUE9cWI5+JmbUsgzR51ICbhaJ50j7K9lvj+2TSMjXNx4emLDd3eHg05hDaewbSWQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634288; c=relaxed/simple;
	bh=wVhqRWNLZk1bqs6B75oHYwXT2//rBMtuWsFLrtykLhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDyugMCBUdRHPSGau0rxEDaNM+Ie24o9x6+sC35fb9uUpZb+VgbTL9uXfjriPXcQEf60XeDWKK9RlX8iobe9ibboJgVLHrFb4mP/HPFUppllhWOJjXDydBRsllkeEJppJqBSfZ7t2T8+1sbK+Zyb41d9bl988RyEtMIlLTcAlAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZ1StWvr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f1c209893so4710300f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718634285; x=1719239085; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TYqDJrI0I1UHhBST5eoFbg+CuNr3i46R10TuIWsB+Ks=;
        b=KZ1StWvrv1mC1WJe2I77PWplyaixdUTGt+8p3GXGy+aCQ5pBWszH8/WxAEg47g1Pjd
         rwQu4gewq2flOHS9vqBNQbrYg6J/mSrGiMypIXB5cnInNBBO1n6BiXP0n/pobGS4E6gg
         SH9ghSoijkcqGb0MHTyXlgvJ5wyz5aeS3E9F0GYrFwsGa2+QFjquckQ2AhjFh+rNl0sE
         5Tga+FheZcd9FXLwx7UtBnNGAJYius54NOCCkj0D4WzHzH8tLYuLdRK4SBckzKer/gGm
         lT9Fu3BqBW35QSOgth3VJbQSSihbN5/tVxyxTs46bL46JLVOC/rvmsYpxtpoGBknJ+M7
         9Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718634285; x=1719239085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TYqDJrI0I1UHhBST5eoFbg+CuNr3i46R10TuIWsB+Ks=;
        b=Ll1O1kIr0fsCO/qKbwWzLmS5EGIjH2ATEVrkTa189vHE9HJrjiaRfuXsask6A/A0Ja
         cBei7ncWoqp+14HZYxua908/iCt9/AiHP1LOuWHUWd7M4fkz4GRUzULkTf1CCpiSf/Vo
         PUiXDDJu1CW0OEAWgfLTEGdqT2zPWm+xotKs4pF4k3kJ8FMRvwvH/8aKOnpjZ4hFNTiv
         PWM1Tm++WVYAfGjvuDObdblJpXn38pYdvLjSfS190c8SltokWQ+fbfRg/enn2nrHVgY7
         wi7Vn3bAgxd/NXuAXZ8iVV2ZZRrZBiGgkVTXp88ryzhB/7vnmrdvdVNlAB4SY33Zq17S
         fMRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSiwf05GxdvCuoB4BOBxFcbLh+grkEXda8wk5MJA7yk9jZ92wg66SOnfjmhahf6/Uqqej7hltfcpSht1RvosnySXsgEIxUFCifmZ5pqILueak=
X-Gm-Message-State: AOJu0Yz5EQrgOf7WSV3NC8xIT9h8BtVwdtNW8CIJ6OwSHlO7E/8eSAbw
	rZp896kuVzRU1femzXoqjCq2JyBr5g+St7BLyh5puqR/5da9r7VlGe7iPPcLnNI=
X-Google-Smtp-Source: AGHT+IFhoW04Z2vjfp8Vdnof23ViUwN5wREaB43PL2wgSa1MkS0vqUdB4gDIhr3ovCzPLliM/vwrQQ==
X-Received: by 2002:adf:f84a:0:b0:360:8604:dd76 with SMTP id ffacd0b85a97d-3608604de8cmr7116693f8f.66.1718634284814;
        Mon, 17 Jun 2024 07:24:44 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm11849360f8f.76.2024.06.17.07.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:24:44 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:24:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: renesas: rzg2l: Drop struct
 rzg2l_variable_pin_cfg
Message-ID: <58d0bda8-7155-4ce5-84f6-74ce3f6d98e2@moroto.mountain>
References: <5c1bf20b-7e94-4b06-95e5-da9f99750203@moroto.mountain>
 <CA+V-a8urbOnrmWbFt=n9=Twis2+gNQDf2_ap-TN42BRdxb5_Gw@mail.gmail.com>
 <CAMuHMdVVnpHrNwYLOAcgyr53cJkw7ytXWj24TrKn2FBjosn-pA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVVnpHrNwYLOAcgyr53cJkw7ytXWj24TrKn2FBjosn-pA@mail.gmail.com>

On Mon, Jun 17, 2024 at 02:54:13PM +0200, Geert Uytterhoeven wrote:
> Hi Prabhakar,
> 
> On Mon, Jun 17, 2024 at 2:47 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Jun 17, 2024 at 10:35 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > Commit 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct
> > > rzg2l_variable_pin_cfg") from May 30, 2024 (linux-next), leads to the
> > > following Smatch static checker warning:
> > >
> > >         drivers/pinctrl/renesas/pinctrl-rzg2l.c:374 rzg2l_pinctrl_get_variable_pin_cfg()
> > >         warn: was expecting a 64 bit value instead of '~((((1))) << (16))'
> > >
> > Is there any way I can replicate the same on my setup? I tried the
> > kcehker utility but it didn't print the above warning.
> >
> > > drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > >     362 static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
> > >     363                                               u64 pincfg,
> > >     364                                               unsigned int port,
> > >     365                                               u8 pin)
> > >     366 {
> > >     367         unsigned int i;
> > >     368
> > >     369         for (i = 0; i < pctrl->data->n_variable_pin_cfg; i++) {
> > >     370                 u64 cfg = pctrl->data->variable_pin_cfg[i];
> > >     371
> > >     372                 if (FIELD_GET(VARIABLE_PIN_CFG_PORT_MASK, cfg) == port &&
> > >     373                     FIELD_GET(VARIABLE_PIN_CFG_PIN_MASK, cfg) == pin)
> > > --> 374                         return (pincfg & ~PIN_CFG_VARIABLE) | FIELD_GET(PIN_CFG_MASK, cfg);
> > >
> > > pincfg is a u64 and we're returning a u64.  The code here is trying to
> > > mask out PIN_CFG_VARIABLE which is BIT(16).  But because it's BIT()
> > > instead of BIT_ULL(16) then it ends up masking the high 32 bits as well.
> 
> Note that there is no issue on 64-bit platforms (i.e. all affected
> platforms), as BIT() does produce a 64-bit value if unsigned long
> is 64-bit.
> 

Ah, yes, thanks.  I had forgotten that it was BIT() was UL.  I was doing
a 32bit build, yes.

regards,
dan carpenter


