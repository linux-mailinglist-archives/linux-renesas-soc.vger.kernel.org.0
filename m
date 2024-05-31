Return-Path: <linux-renesas-soc+bounces-5751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FEE8D5C2A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 10:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83AF2B220C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 08:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7F2762D2;
	Fri, 31 May 2024 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0INGMgJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A465745F4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 May 2024 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717142508; cv=none; b=lOC/SCaqwcdlfvh/bVG8iT7kyE+3VwcOa0iYCEy8HQurvJ2dT7N1cnntBrbZJFurFohJzF/FahNIatYnD1nMsOiyzf9SqoHH5kVv9Cn363ooaCL46l/q1hflV7jm4kp/VTMtBiiJWbdFrnf2xa9zF1Ud/4UhF+G3xJ6Qo6/enY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717142508; c=relaxed/simple;
	bh=kvVPwSeJwasT8CK/Asv91/QGbkrXxOSg5SN57SDZ6Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNNQza/cFO1a0r58Pr1gwDWdSEDWmhhANPg02D6ClZ52Dblm+8ZNRGatM6LZsfMq71bVYyPMHdFoM6XmsPyGvm1ht0LMdUnn7qJ06jAZSjMnkNQCPsdA1lKyOVaZsdnU32qE+bBfuju2ZH1LUzGlPF5OTAVAmwrdOLb7dh/Fr8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O0INGMgJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6266ffdba8so135958166b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 May 2024 01:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717142505; x=1717747305; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kws+h4+u90sJL9kYZ453YSqIAF3ITKBvVIj77h37Npo=;
        b=O0INGMgJvZmu5iwpGBcNZNlV+h/Id5mAIJGnwnpNJLzvxOALnL6jkRQy/CAlgRgDEx
         +wVWLpi+NBzwfMTEyeBKT1ShQncyh6mj6RFSuc5e0eNcRv31E0mOMnx4kx/xbaVY/+03
         RFSYTjAQ76YWWh7Bc3i2AI/vt77nJ61V2L+CVOSCdkXZNcOw5uJdRGO3UUsxdRgs2VzE
         b0x5Qqu9yjmwP+E0uSk4AfVM4WrNYFpO/bGC3uKfPqp6FZeqDYQXPeTB3LsPfeRTGuf1
         INP8oXUVcRLBIHlfhEEK/OxYBb5j2yLu8L1QHDgd1E2znDLcaphCA7PTY89bz3VKQYpg
         dOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717142505; x=1717747305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kws+h4+u90sJL9kYZ453YSqIAF3ITKBvVIj77h37Npo=;
        b=N641yMZLhOc0caqfqN+kGVFzZKMKUyAjd/Jflc7SQk/egnD1vInIST9evEu/Vuuz3y
         WOx+b54JpkficMKWDvuUVJpR9Ai3t6nCYueNcdocyZeNhzCHYnfGM4CFcpQoSHR/jx3t
         OpP28JnmDOHMKAC2NNHQNZ6sbS5vQiVNilhznwLIdv2EpqPEsretzhKYL5xenSAyokWA
         zwHzr0bzE0cjcSd8BHhS9mM5z0vzrE472LvLOjipXVs1pbc7ZkdueEmp2WTQIkSsl250
         4faoOVwyG0BDO3BFFgAZstPm4hoCDMoL37ELhctAgMu6gwS9XYAoeq4yy6vv1lIKqRqG
         opsA==
X-Forwarded-Encrypted: i=1; AJvYcCXMfXnnaUYb+Tzf3oeeQv1ZQZgyMEPiSe7Vc3dzcF3sZB/5RCu9Ou4i/VAlZbMspl4Vj5RasofG2zQT2Idk8/Y/1SSjvJqSRnRjIkwZ/xmbpls=
X-Gm-Message-State: AOJu0YxqCEFO+cxCbSgQ8jHiTre82rAUnYhIJdM/jjBoUH2vMRHKJyRZ
	weDHSDr3uGKT7NS4IFQwL/8HOSA9A6nSj0tRxAL+onnvKEGt2b/Rnm1OJqU/Nog4AtGbrMffrcU
	eAoEqqw==
X-Google-Smtp-Source: AGHT+IFgs2Y0mRlpN9fAzbrNITytfa2iiTCw/kxq4cb2oAWQMnnGOPxnJQdkRcoUaMHrA/saWequpw==
X-Received: by 2002:a17:907:9158:b0:a65:dea3:bbbd with SMTP id a640c23a62f3a-a6821f4e379mr60730666b.60.1717142505160;
        Fri, 31 May 2024 01:01:45 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e6f03b71sm59616566b.9.2024.05.31.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 01:01:44 -0700 (PDT)
Date: Fri, 31 May 2024 11:01:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use
 for_each_child_of_node_scoped()
Message-ID: <7f4ef893-5ab6-4a9e-ad54-4b3587516bcf@moroto.mountain>
References: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>
 <ZlhGYFM6iVlGjZk-@surfacebook.localdomain>
 <CAMuHMdU6V4Ooit7P5pqUFXOZawiZj7TjXY7t=KVk84xPZ0PR+A@mail.gmail.com>
 <CAHp75Vd3ke3_bxwsxzSVzjnNW-6aYDTYHvZ-+B9nJtAJR1fX=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vd3ke3_bxwsxzSVzjnNW-6aYDTYHvZ-+B9nJtAJR1fX=g@mail.gmail.com>

On Thu, May 30, 2024 at 04:36:59PM +0300, Andy Shevchenko wrote:
> On Thu, May 30, 2024 at 2:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, May 30, 2024 at 11:26 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > Thu, May 30, 2024 at 11:19:29AM +0200, Geert Uytterhoeven kirjoitti:
> > > > Use the scoped variant of for_each_child_of_node() to simplify the code.
> > >
> > > I do not see the point of this patch. This makes code actually more
> > > complicated, and I'm not sure the code generation is the same and not worse.
> >
> > On arm32, a conversion to for_each_child_of_node_scoped() seems to
> > cost ca. 48 bytes of additional code.
> >
> > BTW, the same is true for cases where the conversion does simplify
> > cleanup.
> >
> > I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
> > and all but the conversions in *_dt_node_to_map() cost 48 bytes each.
> 
> Yeah. so for the cases where there are no returns from inside the loop
> I prefer not to use _scoped.

Eventually _scoped() loops will become the norm.  Leaving some unscoped
loops will be a fun surprise for the first person to introduce a return
-EINVAL.

regards,
dan carpenter

