Return-Path: <linux-renesas-soc+bounces-9042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1745985C11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 14:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62AA92856D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 12:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DAA1A0BF8;
	Wed, 25 Sep 2024 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASOrUomO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD461A2543;
	Wed, 25 Sep 2024 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727265405; cv=none; b=Qmv9eucALrvEdnjmOHGQZTL8S1bvdulkjxV6WGcVHu9Tuiby/v0SWVMCwWEIb7IZ5QHdfi4pD7/fqxJ0ZV3qQSJlBgmDnJOo+P5UHf0dT/jFvAXd6Cq3ExKCP0/b7rzqE6QvP06nEPev3XI7yAhuZ8aa92VSLfN5N90Ue7p76Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727265405; c=relaxed/simple;
	bh=XZolqSJ+eNDn6FmOoRMgkvocT4H2DnVxnc3fqSDNi6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptlnWI2es8CMTnioDB5E27BXlIF0MZgG5OSn4O1mA6BgFRMzPXxD2mwM7+ra3vF0fsztuocCGeNRJ3lEpGh2y0EuYV2DnjEgbiVkMwppF0pR9H0nT//FMU0JrLDO2ZbnLZtE4GUcWJYvenaB07cV+N1W3T/Nb7sBuI3xTGviVdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASOrUomO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cba8340beso5344715e9.1;
        Wed, 25 Sep 2024 04:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727265402; x=1727870202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XILSHzq9nQZV9NifbVeJerbRQ+UKtP5RBCA/8zOessU=;
        b=ASOrUomOJZwdRLv3rc+AqoKhsfuBUaRvWJirh/8pOS9UJ9vR0ZYnSYAzA7D6tZNFuF
         k2UqvpEhKWSCBkOyNxv8uYnka7ey03nkO5htRC5hvmgnpnjAFR8c2mqtQ3RqsV8rT3yE
         2zCrLRAeqzCt4+y/p4dTrLJzfgDemU4HfNj22/Nqpkrr0Y4hwN+v0LKjdENdeQu81aXw
         OktSiizkJwb6RHgC60ku+WcHuDKhxdlORb/OyaimbeENGWxnuytiHGWSQ9evtN0OZ/Nk
         ZlmVhOLQ45lQsAzZWK8Dl5uL9Ih/ESKt/XA/HhU46l+ALwMCa7Gb+Qww2bHde/YWsOho
         +rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727265402; x=1727870202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XILSHzq9nQZV9NifbVeJerbRQ+UKtP5RBCA/8zOessU=;
        b=Ja1WWbCloKJUTY54jPxbnDUW8K7g9046ENIY3eLJS1JOVJtxzpT5R7TdWgsrlOerDC
         LdeQ4bFMc/bCoSxtEBRKf7OHd+1mfIGFfhbspslUHzsoJZd5pa/o4ZvRKxiGduuze/Hh
         zMTcsFdO2YXdlWnHG4r0kkOokFNvcdDdp/8kdr+r6K7rninjPGLxGn5UoFK/6S0ziXLn
         MwDJyNdDckypfflSGY8cWnEDI39FyS6ODdOECAnkx7szga9IvEvR0OeSfCmMNKw9qE6f
         JNBmG07J0eHQOst7CmeSYUskxsPo7A23pApMyvsKNPOP50upmJwoHz3ZgRpcnr+nFFYV
         V63g==
X-Forwarded-Encrypted: i=1; AJvYcCUSFhkwCWZOPS5opnYd/VeWD0gYNeJzxoodKqR20krm0QSfRrL3rQpaPPr059MAPwtcr/QVB7V6@vger.kernel.org, AJvYcCX3aGnlnGZA/9OD8MzIJfZ0gd+5jZlgWT8jqSradkw5L5c537sHY1WBvvltfbY8RXELP9l+Ob2q1qwjhdQqmOLHDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6qqqazZZOyrx5DGGZLcxDTbKZIYsqd3vtrRbylv/Xi7RFOMNp
	2//yUDgz71gucDU7cC9GIJwfGfYh7lFN8qGN2s9QBceVwY1mzOtc
X-Google-Smtp-Source: AGHT+IFfChHSFMx35WPuWNGZLOhYOh1UqbLoJCne5dj7IUFTXXA18rIIzXkY4Lz2qahEQmrwyr5joA==
X-Received: by 2002:a05:6000:1290:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-37cc2cf82e8mr1723652f8f.29.1727265401921;
        Wed, 25 Sep 2024 04:56:41 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:bfae:1f4d:37af:7b02])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ccbe23336sm621707f8f.62.2024.09.25.04.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:56:41 -0700 (PDT)
Date: Wed, 25 Sep 2024 13:56:39 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <ZvP6d2YNKKxJPGvQ@eichest-laptop>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <70b86181-7bcf-42d7-b5a8-d26ac0c4c573@lunn.ch>
 <ZuWW4UOtOGI_KmSg@eichest-laptop>
 <cfb43b2c-79f3-48b7-8466-e7f52d20ee56@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfb43b2c-79f3-48b7-8466-e7f52d20ee56@lunn.ch>

Hi Andrew and Niklas,

On Sat, Sep 14, 2024 at 04:50:02PM +0200, Andrew Lunn wrote:
> > master, I can normally do: 
> > ethtool -s end1 speed 1000 master-slave forced-slave
> 
> You might want to try adding 'autoneg off'
> 
> If the new default is to perform autoneg, speed 1000 tells it to try
> to autoneg only advertising 1000. If the link partner is not actually
> performing autoneg, it will never succeed.
> 
> This is the regression i was talking about. For this device, due to
> its history, we might want to default to autoneg off.
> 
> 	Andrew


You were right about the autoneg off. I wasn't able to turn it off in my
first trial because when autoneg is not working I also have to set the
duplex mode. So the following four things worked:
ethtool -s end1 autoneg off duplex full speed 1000 master-slave forced-slave
ethtool -s end1 autoneg off duplex full speed 1000 master-slave forced-master
ethtool -s end1 autoneg off duplex full speed 100 master-slave forced-slave
ethtool -s end1 autoneg off duplex full speed 100 master-slave forced-master

So for our use case everything is working fine now and we can live with
the fact that autoneg is the default.

Tested with a mv88q2110 device.

Tested-by: Stefan Eichenberger <eichest@gmail.com>

Thanks,
Stefan

