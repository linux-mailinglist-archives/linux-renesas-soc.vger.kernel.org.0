Return-Path: <linux-renesas-soc+bounces-4032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4588BE20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 10:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7451F3D9CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 09:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5023A6BB37;
	Tue, 26 Mar 2024 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dHUb6pgw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9F666B50
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711445891; cv=none; b=h3hLcL3nwLhNZdAd6Ec/tcL3eYnUJ6nLhQ5L/1z8qL5HqV4PaXQKAJd3mJpPcIg0bcjB5qTdPiFCpEKR9DUf1dV58td6T9nS0Tm4AsO6xiHIN279RL/phb+vQ1AN/8f+q+YkknXzvzCW16XY+9gEY9waMFuox2R43jNLM2TMO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711445891; c=relaxed/simple;
	bh=Y6t6I6GHzsa04kOYqj5EDlkqjCcXCb3WPynd2QzK5pg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mZEFRavrYra56LGx6NkROCQ6AqmiNj3Hu3bs44lHFsFHlQIqWB6gHSrR5GqZ50Dnhgy44H2+pC0EKVMWu3loqKEZII9KIdtbRsqgmdIDU1lRThjC8zLjqziE3I3cPWGX2omxq1HSKCtoh+xJfLGT3WmKqakkYx7St6ETduQzZ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dHUb6pgw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711445888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lq57SkoaYLcHxhyvenrH9jNvgNPibBPJSzi3C+8+Nug=;
	b=dHUb6pgwklWvkIY8ngSuKRV20eDrxK9VcHkIeOwQJsSrqk9KgLgxs6TjptspsX7GQMwY1B
	SyMBDszHizdBM1lyU5btrmPTxvtFr1i0ly/lSzL6jKBD6M6X7vik/7K8pusc8L1WteutyQ
	VSjZuYMG1626h5DsOrNgU53NXbTFqPQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-DzYDFd3pNIOuH9zcSc_OWg-1; Tue, 26 Mar 2024 05:38:06 -0400
X-MC-Unique: DzYDFd3pNIOuH9zcSc_OWg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33ecafa5d4dso990389f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 02:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711445885; x=1712050685;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lq57SkoaYLcHxhyvenrH9jNvgNPibBPJSzi3C+8+Nug=;
        b=bPXxBXBo95VqE6cZ79BkTtnJ7CU16XjrRYsxmmE0wA8vP17G4ZDS4+vV0JjEwVfWu/
         voZuJMhfxzJMvBOI2GF+YzuEW1NY7NTGAzKgGkrZ+bjGLHS5NuLl6Ih/6aMnjQTBLOUz
         5TjLQKlafxZZq0FsSymKmstsLKEG3A5WGj5OrmduHhEdGpzL3/LX56othLqhz8ai/Sns
         61yVvv9EwYCLParLp1m+7Tl7HMLbxt+P9JW8yc9GsFwwjpYi6rRTcYy4IrFSIry1ms93
         HzKP8rVkF+RI5la8UdEPAXcEcElfg4Df73Rnd3NIBGNImZl+JG8Gui3aa6gnyOmhxeG0
         HhFw==
X-Forwarded-Encrypted: i=1; AJvYcCUUuyNhADXxZgBSiQNnxmdDqegzog7icn+UA6gND2Hq12hch2e6felivtZQ43kWLLKXieWDCQx8WbyyzQBc4u1VDj4g+B5lc6BheP0yjWjtCA4=
X-Gm-Message-State: AOJu0YxWbhzJ50dstPzdQ8XxitnrC+bIp15jSTYqqIAO/MJP1NFYocQs
	H1JT20jgzTAnRCot6M13GfifOzoOtLxptb6aTz7qHE3fv5mjPQToD2DTMuqQUPbkSJi0wuN3ikg
	1tXQQOSAF6PyECtOkGbojJwAXnlpDXV9zKw3NthYcAx4mi5O2sgivbI5HXGK537mBBOHD
X-Received: by 2002:a05:600c:3b0e:b0:414:8889:5a60 with SMTP id m14-20020a05600c3b0e00b0041488895a60mr4417847wms.0.1711445885411;
        Tue, 26 Mar 2024 02:38:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDb7+Xm4UQ1SQF7EZa6f47MjQV1Pu9P/Oc97MZ3GpShnalOCbN0Q3zlbmjhipTYkrPkHExhg==
X-Received: by 2002:a05:600c:3b0e:b0:414:8889:5a60 with SMTP id m14-20020a05600c3b0e00b0041488895a60mr4417829wms.0.1711445885043;
        Tue, 26 Mar 2024 02:38:05 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-229-159.dyn.eolo.it. [146.241.229.159])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b0041409cabb39sm10946382wmb.18.2024.03.26.02.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:38:04 -0700 (PDT)
Message-ID: <87e9ab7796a647e7ae674ae2301729f50e4e1b2f.camel@redhat.com>
Subject: Re: [PATCH net] MAINTAINERS: split Renesas Ethernet drivers entry
From: Paolo Abeni <pabeni@redhat.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, netdev@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Tue, 26 Mar 2024 10:38:03 +0100
In-Reply-To: <de0ccc1d-6fc0-583f-4f80-f70e6461d62d@omp.ru>
References: <de0ccc1d-6fc0-583f-4f80-f70e6461d62d@omp.ru>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-03-24 at 23:40 +0300, Sergey Shtylyov wrote:
> Since the Renesas Ethernet Switch driver was added by Yoshihiro Shimoda,
> I started receiving the patches to review for it -- which I was unable to
> do, as I don't know this hardware and don't even have the manuals for it.
> Fortunately, Shimoda-san has volunteered to be a reviewer for this new
> driver, thus let's now split the single entry into 3 per-driver entries,
> each with its own reviewer...
>=20
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>=20
> ---
> The patch is against the 'main' branch of the Netdev Group's 'net.git' re=
po...
>=20
>  MAINTAINERS |   29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>=20
> Index: net/MAINTAINERS
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- net.orig/MAINTAINERS
> +++ net/MAINTAINERS
> @@ -18724,13 +18724,24 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
>  F:	drivers/i2c/busses/i2c-emev2.c
> =20
> -RENESAS ETHERNET DRIVERS
> +RENESAS ETHERNET AVB DRIVER
>  R:	Sergey Shtylyov <s.shtylyov@omp.ru>
>  L:	netdev@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
> -F:	Documentation/devicetree/bindings/net/renesas,*.yaml
> -F:	drivers/net/ethernet/renesas/
> -F:	include/linux/sh_eth.h
> +F:	Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +F:	drivers/net/ethernet/renesas/Kconfig
> +F:	drivers/net/ethernet/renesas/Makefile
> +F:	drivers/net/ethernet/renesas/ravb*
> +
> +RENESAS ETHERNET SWITCH DRIVER
> +R:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +F:	Documentation/devicetree/bindings/net/renesas,*ether-switch.yaml
> +F:	drivers/net/ethernet/renesas/Kconfig
> +F:	drivers/net/ethernet/renesas/Makefile
> +F:	drivers/net/ethernet/renesas/rcar_gen4*
> +F:	drivers/net/ethernet/renesas/rswitch*

@Shimoda-san, could you please ack the above? We can't appoint you to
something without your consent ;)

Thanks!

Paolo


