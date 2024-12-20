Return-Path: <linux-renesas-soc+bounces-11654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB409F94F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 15:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAF53167393
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 14:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01132218AAC;
	Fri, 20 Dec 2024 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUrWXNxX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D5218AA8;
	Fri, 20 Dec 2024 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734706711; cv=none; b=sy1cTNdYfQ01udRAja7xaQxKzHaqVhECFLgRWguzQdHj9CQbEd/pWlAjCFkXMvC6Yri0vXO4d1LkmoGakSI9KgXI1eYRxFC8fEdU37gfxWDWmqCaGjU5F1wlyuZMQLjqd2eeJeJkqC6C+2QLXwf/6lorpSQP57GR00OyC5pXqUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734706711; c=relaxed/simple;
	bh=Jb07ZI+JEHWSTx3XvR9ujiQl12yX4XGtknHNOjBPDbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K776NiuJ2ndTjALdP4RluyHDl0dnVzXZf+jfdiLkeOJogGJD1d34IIl5UNbULwbbwfHvs/8VlFmcAs8tKvfTtGiYezaYTXBcVWpskisMU03CqzH0X2uhum/8yIp4F775ezzVR8a1rQBiTZ37Fw8vyc6AxsmA0EdCcPAaTxbPmS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUrWXNxX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166360285dso19682115ad.1;
        Fri, 20 Dec 2024 06:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734706709; x=1735311509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16z8na+/hfYz5hmBDlf6BWo+5Q3qok0vOlMY6gdNLFk=;
        b=GUrWXNxXiylUJ48z3GiwCczOFzItRP92rq+Usr4VeZgLnI90i5RId533/uxuz7urfV
         i8sSPoACG94QTi93khiJ8x/c6OV3Df+a6RxpdYAF4fsL7Y6l9G6kgO0a+tt+iT4boCGM
         tMoOIcqQ73ityO+5QUUoeH+EPOAb+08UfXZqM2IbtBa/IjX/3BMywd5gC3j/Ob+w9cXS
         VMqGOEmaaycv1YfT9xLEjlmj/1OznbmYHIDpud76WmHH75nyQgymxeZD6DzICpkMKx5I
         Ge8aaN9HMh3GZ66Mi5mwhdVZYYMz7LjPnrWp9I9ecZWbx2sXaT03Bn5Wdhu6+Jt2JY1Y
         jojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706709; x=1735311509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16z8na+/hfYz5hmBDlf6BWo+5Q3qok0vOlMY6gdNLFk=;
        b=GSY3WbLC3lrkxe0QTX2nAsqzIvYQKQOXD5ASwCgXNjnv2RZv3TYRjB4lK1srqElh6C
         SX8HMywu/q8BW+CdPr076dlO3s5oeioE1r2SR6Q7/l8ZkpnyQsF34AWGVrOf0N9yGb1b
         XTuMT9mLdf+OHqnKolU8KjRS3wsdELW5ADrhCdK3oNAMYDgyVrP6ltsjP3A4Q+1CLb7b
         rnaPjktjfR3RIfU4PCDQ9YUP9y3zjvFarM5qyelugvUzCCn7rt5oi6YQuC0MCBKKsmgA
         uSWGFm+CD/nPET6pZVGjqEFwjN8zfjo5BkKDYQCoX3D33TOubO/Q2k1xG8FLPopQkRLH
         PC2w==
X-Forwarded-Encrypted: i=1; AJvYcCWAWGoaF7m2x/0oy6B9hurU+is/9Cv3/Y9dsleNJFm7BsG680/xmFa91L4ZaKoLTi9NhRYIuQOZrg0Jzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUh3fnpsrIFq4zIeJm+2C1hJTY7HnWpfPir1ubDrokVjT7S+1y
	sSlGnCMPTxxUJ18xeGwSkDxG4tCwNY0WcQRgUobWbJOzyZ+2EtAG
X-Gm-Gg: ASbGncsbX+3h3SoIhP4Eec7zvSOtuU8grBV2udi3xic6/Vr0SBqgPWAP+SJZOI6ML/7
	1G3RmQ33eb0v7u0RXp4cQvGVgGcNWvFc8cS3eUIMr7332KIeZxwbdpWDFwFI8DNMMMe4yrRScxg
	3wlKsHiuYpB5cJUY/zsbcqd7vb8AUyj24VyyLfeTxhnSKordV/3oH81RQUNhqniNY0c6DCsWpJp
	SirHdhFCkWxD+GL71EG1k+nQOduN5j4zdbb5UgKoB7q4vomdkC98WovYvcqFuNkZy1T0w==
X-Google-Smtp-Source: AGHT+IFJW7UATrfhpNNlOihGcDYZyG1Vp9yyYCO4dHbNbjKOcPJdX2kcfBkb0xfvJ/wj6IfcgRuyNw==
X-Received: by 2002:a17:903:2c6:b0:216:2a36:5b2a with SMTP id d9443c01a7336-219e6f25e3bmr47196165ad.47.1734706709431;
        Fri, 20 Dec 2024 06:58:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc970cb0sm29933255ad.74.2024.12.20.06.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:58:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Dec 2024 06:58:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH 4/5] hwmon: (lm75) separate probe into common and I2C
 parts
Message-ID: <efd84ae8-3906-496c-8f06-3eaaca243384@roeck-us.net>
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
 <20241219225522.3490-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219225522.3490-11-wsa+renesas@sang-engineering.com>

On Thu, Dec 19, 2024 at 11:55:26PM +0100, Wolfram Sang wrote:
> Put generic probe functionality into a separate function and let the I2C
> driver call it. This is a preparation for adding I3C support which will
> also use the generic probe function.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter

