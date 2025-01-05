Return-Path: <linux-renesas-soc+bounces-11857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 522ADA017F3
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jan 2025 04:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C17E7A193C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jan 2025 03:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F02E35961;
	Sun,  5 Jan 2025 03:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1zm43Vw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD3663A9;
	Sun,  5 Jan 2025 03:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736048341; cv=none; b=gI476fHSPUubnfACQxBnVUTgLStAEM9qNfOD6qQBaAjEYlpXp8SWORMrOenlHRhysHPDyU7t8HI9aW40aQQaopCsrO2jwWNXEEq5GZT40uHdC4oyWGXdc5avkOT6WHR8jSS09vuhnnN0xHdNSLyVQOQXa5Gtdny6ctiRG3lt/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736048341; c=relaxed/simple;
	bh=yNdSFk/CLFtb27KFAdNS2MwEgob6/gf0YzuRH189+Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d56qTzJHni52FhJbz0gkYUfIS76NBgPRS7YrOxmUpRTnWv1UtkmZ+XdXMLGKRms7KrV/AiI+mpAZ2+rushjTDHFykilme8sTqBeGReblGXIVpPuqKJmOelKm16O2H3cJajJwiHN7GXUTUmvyvB9FOxeRuKBd8J4wV2yGV53DcKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1zm43Vw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2156e078563so164150185ad.2;
        Sat, 04 Jan 2025 19:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736048340; x=1736653140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g6D/wa1IwTh6EdmkoPQJ2wsfsDe1R0UMTRH3+UOd7Eg=;
        b=H1zm43VwGknMuzEseGdGGILgkEhaRhKEjnpnKqd2u92re065GwRqdLF6iKzTGJi0YN
         8bcQNpVHCnIDy2IrwooVoIoXhwjNwZgMLIxOgUpJ1m7E+IzOhyANSgtC58LTSHVOGXHc
         Nd9FkSnLFJuOhHAzhHZgCfejZqcHIQe8I4zvxRej2WYvR9IF8hkj+S8doJBcikt1hDpw
         GLM1wPMpGU3BiVxwcQXbOg3VcS8zgnlMWTKfuGhD/rHeZLVQXUXeUeiI4g313s23vFOE
         KY8hrpX+kZjbvRDL7+CaM+6OezK5Dq+gLTSfJrdpqRYEB/AXeWj9xn0XbnHkpymj+CwQ
         rVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736048340; x=1736653140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6D/wa1IwTh6EdmkoPQJ2wsfsDe1R0UMTRH3+UOd7Eg=;
        b=Ui25vfFZ82lh6CPVRnpG3+uvsocrT9UYlFo7PjGrZAiFnSjuq809CCED00RiXTjoDj
         sCyzRQL7JZOptN3YTU/wFwXF0DqDAgv2BDc+QpEAnNbLHItEUS0OuvjkOEEPUm5jtEWx
         X9/LCS+UuCGcam7Aj3fUX7pe5Q1illIdWqYXy8dnqkO8sim6Eo0VAAxJCd7nhuVQtnFx
         XBVD35uO8ndMAUdyBLqCDgaJGCcUPDWAqSHiy7/aJTXwGDI82nbGXM7O1jMSBxC2O2ZK
         MAE+oWHqtdcuJOkv9cxSTyibbuoanlfmbyXbrkKgC4BVy3CCR+cQilKcvpyXgXr+wVcF
         PXeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzp6q3leej0EHaX2C9TR/qIPkJa1ZxEIiwl6JNIAgS57PKmnGJ2IDE0Zvz76aqvu1/T9x5aIRO287NIchQ@vger.kernel.org, AJvYcCWnimdD99VCXpCxFLwaYPDAc87ZMG0zwk6CjxJ2I9itYW8oU1xkJsXDRdSce/7EFmS/olbPoyDUtR+5Pw==@vger.kernel.org, AJvYcCXLRqsU+Tx46YhhlQ9xTro57Xmv/0+o205VDQEO3SwpeFPFE0PMwkEdHOep+09XinjE0a5VekT/4F7hURaI78UE94E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaGtve1uid4n45BDBy9tnK2kmSkGOScniKXJSl3rqPvJ75l5yJ
	qYxnx9+wDmyA2zI6z4OiT5GhMUvPPLmGFnIL+8o1BEjUZMku1ykQ
X-Gm-Gg: ASbGncsSmjGqIiklLkXU3UMTi8D6TAgtYuZtmbKmEcEdhF49TF6N6AmBAavbwMpBaWT
	xmgOptGcUdVkEAmYd7xMH2PogfathqmzQkw2JFE7yyKUf1eKb4XOqTXzeX4x0DpmmEQ6X0JjukJ
	ucLTqlnrKoxKFKAFsJspjKl1w3OKwaSS2TCXTlGF2b/aELvbUdATeOoZDY/etbJm5xC/vOz7O3m
	eTO5x9Mn4v6tZI9s7hI19Jczu6FLJtcUrQY8J7MNQANYRqG9Xq8+5qKE43QQ4J6fyEsqqNrOmvm
	nIUi
X-Google-Smtp-Source: AGHT+IFcujW59lIZRak4GyPzLm4B+QCpjzjKY/tXSSyQbMdi8o1a3Pbw/Xg5pu21UzrTWgpOaUnqjg==
X-Received: by 2002:a17:902:d4c6:b0:211:e812:3948 with SMTP id d9443c01a7336-219e6cc87f4mr741172775ad.0.1736048339584;
        Sat, 04 Jan 2025 19:38:59 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca028aesm267405385ad.264.2025.01.04.19.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 19:38:59 -0800 (PST)
Date: Sat, 4 Jan 2025 19:38:55 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
Cc: linus@ucla.edu
Subject: Re: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Message-ID: <Z3n-z5xA2ue8ojiF@yury-ThinkPad>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20250103221117bb066057@mail.local>
 <Z3hhw_pwFAicsEDi@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3hhw_pwFAicsEDi@shikoro>

On Fri, Jan 03, 2025 at 11:16:35PM +0100, Wolfram Sang wrote:
> 
> > I'll apply the series once you get some agreement on the function name.
> 
> Thanks!
> 
> As said in that thread, the function name has already been changed in v2
> to the liking of the bitmap.h maintainer (Rasmus) [1]. He has not
> responded to this series yet, though.
> 
> [1] https://lore.kernel.org/r/CAKwiHFiamZ7FgS3wbyLHo6n6R136LrLVCsih0w+spG55BPxy8g@mail.gmail.com
> 

+ Linus Arver

Rasmus is reviewer. I'm - maintainer. But I surely agreed with him.
Shorter name is always better. And we're all kernel developers here,
so we used to read and respect comments. The comment clearly explains
what the function returns.

I'm a bit doubted about adding a web link in sources because it may
become invalid one day, but if Wolfram commits to maintain comments
up-to-date, I'm OK with that.

I already acked the patch, so no need to ack it again.

Thanks,
Yury

