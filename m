Return-Path: <linux-renesas-soc+bounces-11444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E459F45D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 09:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7B7C1665F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 08:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1851DAC93;
	Tue, 17 Dec 2024 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aa+YHXJQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CEC1CF2A2;
	Tue, 17 Dec 2024 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423343; cv=none; b=nF0FBBRNkMMtRdwbPqkEt02xY/ohgXJ9qMPKW+SvYjYSeVaB010GegLm3RCHFljKv3DoQ2mEFQUCcQsabuo7uLEFhaF8qkj5vZzR0Q7zb19VYjjyHx4xukgXpFWPQyBRUREMJrUXcQN7dPGCf6NhP0C01fuMd6oN3uJieotVjIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423343; c=relaxed/simple;
	bh=v2EtpzylHCMVmeaJp2tMr+VfEj8kbz8WIuUYHP9gyx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dI+ZuMmNV2gt2wzjm3GcOSTu1ikgQXnHDNDNfzefzNNtwHF+Py9MpUqE4hPG/0xcDG3j3qFeuB7n9eMSEkyjruda9h3Kqb4K41+Kfkhyx+DfG/Q2YZPmnzUh1hkDMQCTiPMU6/ojWKjkZJRQfwYE5HxPQg9hktIDrvaYgdNLXGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aa+YHXJQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725ea1e19f0so4290162b3a.3;
        Tue, 17 Dec 2024 00:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734423341; x=1735028141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6MRckoNlqZpLBpjip3AWCGgRxNR2zIWh8dpqKI+jRKw=;
        b=Aa+YHXJQYEWmg2f81gMDfFGKGBXng4HwmopROz5SD1ygP1dQes6Dza+idwxboKjAXb
         QgR85jfe9cXYDVI9M+Hz9OE7upmxaFdwamtvWqG1zEMOdWuHFRy7asgvbfJ1umNXUpAf
         mx7V3m9bHxQp3tiVkqNiRot+YkeCgYDefVR+TFLAOx/161oA3TCFZhGqPuilmf+seI7i
         cY8dlqKFRPzD6RQZQQORpD2FEkVoI2Eb9N5HILX+YwASSmHT7I6AA91cR9hL5yiA2dOg
         8RShJJLOWeQubmiN7o/pT8YHjr6ApMgpDJ2uiBy+glb5mtKkV6BudlJMq77sZzz+YF76
         k+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734423341; x=1735028141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MRckoNlqZpLBpjip3AWCGgRxNR2zIWh8dpqKI+jRKw=;
        b=uQvj+710hF0uqHaBicCpowYup1LF+l0hdm0WqkK2V0qbE7fQHLIOI/1VDJnRxQjtDx
         B+Dt07ajODh0jIPemuU9dczMrx7BIsHa7F9kTZacet8wOYYNiKdi7r1VN9soK+kLtZEt
         DJC5sys/kxWNGCTxi1KPcwouXV5JDPzg8VeZjH53xg3zVA4pIhza/UpWC++s148mW/1F
         lE7H3/562BRuRB9z76+Prwb9GImGCI+eFJcZ4/sADdERs97PAsNSLV04DbI/l36Q1UkS
         quKb52nZmS0LU1/mZyQD+6ZP+7dh1oUkGHnsl3nfj9CQ6SeRWYccozYsHPU9QLyDfxu4
         ogdA==
X-Forwarded-Encrypted: i=1; AJvYcCWWevLVhO0w9lTzAqQc7CHZAHIGbcxXNsaLl0qtfA4UxnWn7JsGo3kIstsBPhQCOKUpYmEzjlCOrIN7kGBp@vger.kernel.org, AJvYcCXWGwE6p29z/Cg3oQEvG+ufvRCoe3pgCF3qg6AqvnPapbM50Oo1qP15+n4BUl8Ckj16ojNV0RgH+KSVGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySxYGTtUEQQU9GKNv3LaYlNoJPWbqzTcNRDOBW7QnSuAWcqVk3
	NYchKlqiMW/Diwre2P9GlOwrvHPaUVhmZd/8gGOboHbZRAhWqyRE
X-Gm-Gg: ASbGncv43jRSmbeLhs8dpT+6Xsr4Ntypgitzk+qI8P/y5MRdYm8lt11XL1uU4eR78N0
	T4BLt7ObecvKqwF3ItHCpZqrVllQCuAfP/U23kniv7dzaKWUExqBnZ/Rdh3O5dCKxP34stOeXiy
	B/9m5U4jxNPqmhGVyKdqsZx5ecLTZbErAdoZJRwC76sszdqEYPtX8kkVDnFzi0IjdH+SJeprxPf
	Td8oWLRHtCnxsafnUaAwbx7D1YiZOX9rDn5P1o+yVv5besddEr4MbHVucRYqKioBL0I5pEQUBlb
	QqWtJvn1
X-Google-Smtp-Source: AGHT+IEU9gKtSQDIjfmAL7ioyGt933QTWxeJUGd7RP6VzJhxSMuiT2RaglBNkVWVtrqnk3NJmbnd7Q==
X-Received: by 2002:a05:6a20:c99a:b0:1db:e3a2:ea47 with SMTP id adf61e73a8af0-1e1dfd1fa49mr24027942637.14.1734423340737;
        Tue, 17 Dec 2024 00:15:40 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5687sm6069722b3a.72.2024.12.17.00.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:15:40 -0800 (PST)
Date: Tue, 17 Dec 2024 16:15:36 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
Message-ID: <Z2EzKErhR2MomNz+@visitorckw-System-Product-Name>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214085833.8695-2-wsa+renesas@sang-engineering.com>

On Sat, Dec 14, 2024 at 09:58:31AM +0100, Wolfram Sang wrote:
> There are multiple open coded implementations for getting the parity of
> a byte in the kernel, even using different approaches. Take the pretty
> efficient version from SPD5118 driver and make it generally available by
> putting it into the bitops header. As long as there is just one parity
> calculation helper, the creation of a distinct 'parity.h' header was
> discarded. Also, the usage of hweight8() for architectures having a
> popcnt instruction is postponed until a use case within hot paths is
> desired. The motivation for this patch is the frequent use of odd parity
> in the I3C specification and to simplify drivers there.
> 
> Changes compared to the original SPD5118 version are the addition of
> kernel documentation, switching the return type from bool to int, and
> renaming the argument of the function.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Compare the results with hweight8(x) & 1 for correctness when x is in
the range [0, 255].

Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei

