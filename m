Return-Path: <linux-renesas-soc+bounces-9044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A698610B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 16:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5C18B322B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 14:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502B3137775;
	Wed, 25 Sep 2024 12:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3lJcJ5b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B915532A;
	Wed, 25 Sep 2024 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727267006; cv=none; b=MCsBjtF6kKgVZL31NjR6p76NoO16ugP2mqTSYJuq38lUfDvVz37Obj4eInsqPrZqKTdBPFTiFOEFuUCResBKh3vF4iXMLbDmHY9vhCX7icsRYxW+7Q1JS1HDdyH4leaaez2wgd2URqPYbsnNCgDcEz4x6RxFDx81LYhrEQgXh5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727267006; c=relaxed/simple;
	bh=hYhp4HhYcQeoLAt/F9SdqdaQuOEJoloCHzsxZuXigUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kttlkvMBp7pyCoX6vQcHarlDWMxxCjGZuNFMY91/iaKx0ZZ9JmbNU1Io80NZ5xYeruZx5fUieesRN0487ZGg+OQLVGMfCDZ8Phv6xncKqbNXQl0zPG6qy2GXUq9/otoIGzTvXwkHeg3pI0M4APoewq2HWgSD9pLINavTAXbnJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3lJcJ5b; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37a33e55d01so5027911f8f.3;
        Wed, 25 Sep 2024 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727267003; x=1727871803; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m1RREKOHOhRWddTC/OgKLn5uOO+cRvYYCz0ezlbkx/o=;
        b=h3lJcJ5bXsgsBUkXybh3siB7llsRhRIUefEkt1x3KNoLksMDY8ZUOAG3xRqLH7xgbk
         B+oxmgk+TeLECKXaYiAtpNb5Khf5OcpycAOl1p1IwD7fm7QeQvK1CKvNQDD+Gr7mEyQw
         tEYY+FDczuTCW2ksOAArXnie7+Cr4EG1HCMTCKZQVq+Wc/oyTwIEIFbPJHFHVOhixx42
         gRCHWgf4a0e63ZOYjoJ8+IniAkvlLPwm5BEhavcdQ0a95iIoRcED5hb78Jnvu/qAr2GH
         pqssYcivb5WT9qyu5N1rn81r3vT5v9Di3B5sBdI+11w+z9p4ivyhbK4JVuB3i8pZdfwp
         0K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727267003; x=1727871803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1RREKOHOhRWddTC/OgKLn5uOO+cRvYYCz0ezlbkx/o=;
        b=LWh4hfKhABgJlttwaJ7Zi9i+u33rnrk+Dt0W1r9DK/80D8DsitLJKrIJl8+BREJYG+
         STzYLJ++VK4AFuYJHeSvQf7JeUME57SmR8yTEhXEHZLQzFHKrgwrI8U4fSeWHlPcW8fB
         eDdg2trhcSc8VLkGVVKcnFvkZ0caRH2pkcnHvCzvePTcZXMn9bqVk1p3/Ri95U9ewEVQ
         DXBXyV04+zTVHL+h5PZlQmqGLu//EC1J4nkuLyooQKPXGUoFhXqkUkQsIBHt82ivorJq
         fZDk7SQtwsocUA0ZBH0cp0q0p/7lOVUWvADqotOmrjjnyd/E3KlWR/aZWhVmwyeaPtxu
         qBug==
X-Forwarded-Encrypted: i=1; AJvYcCU6A354CKnCRTJ3FwW1gj5W7GrSGnmmZm7/3w3L0VpfXMWF0gALQZOHnssU4NOaefsEYzC4Jdti@vger.kernel.org, AJvYcCX7KiQDQghOMo4SpVonApnIBglRGWOwnuNwBgAWPAK0/cXVVrJwO1Zmjmy/ywTpYZzYY6vQc3Slj3mB4uG7AnVg3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqnd9cYyHDpGlYDO74YSOGTBXjesf+z3KrRuAnyrsfyMjRmK8
	cJXMAgzcjNHK3RloiUYwJymoD59cZOKwMB2iH7EvlUmWLy67AeWi
X-Google-Smtp-Source: AGHT+IFQffkD1R+3XKuN7FOd/FhlbemrXIaWOy8RGuDQ7msO3hEBPXuiWUGpIabBYeuy1GUAy+C7tw==
X-Received: by 2002:a5d:6089:0:b0:374:c03e:22d4 with SMTP id ffacd0b85a97d-37cc245b08emr1955481f8f.1.1727267002488;
        Wed, 25 Sep 2024 05:23:22 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:bfae:1f4d:37af:7b02])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc31f33bsm3872589f8f.97.2024.09.25.05.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:23:22 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:23:20 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 2/3] net: phy: marvell-88q2xxx: Make register writer
 function generic
Message-ID: <ZvQAuFLuxSxE9AQy@eichest-laptop>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906133951.3433788-3-niklas.soderlund+renesas@ragnatech.se>

On Fri, Sep 06, 2024 at 03:39:50PM +0200, Niklas Söderlund wrote:
> In preparation to adding auto negotiation support to mv88q2110 move and
> rename the helper function used to write an array of register values to
> the PHY.
> 
> Just as for mv88q2220 devices this helper will be needed to for the
> initial configuration of the mv88q2110 to support auto negotiation.
> 
> The function is moved verbatim, there is no change in behavior.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Tested with a mv88q2110 device.

Tested-by: Stefan Eichenberger <eichest@gmail.com>

Regards,
Stefan

