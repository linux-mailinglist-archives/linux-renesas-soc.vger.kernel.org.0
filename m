Return-Path: <linux-renesas-soc+bounces-11445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FA9F45D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 09:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE8E6161F20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 08:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B7418C936;
	Tue, 17 Dec 2024 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+Go7ra8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD1B158DD0;
	Tue, 17 Dec 2024 08:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423377; cv=none; b=P81ATSA6o8mJFE4q+lg6Z84hdolg0Z6vhUGY6s9isxfIOgzwF06Lp8NbYeBbiZvB0dmXrJa2rmkIdmNOam9PR5UcdyJZpcdJgj+01rYbTOVogU7mmMKorxG+M5X7R9LraTsG076fV7A6ol08MKDqCaolPzVKylGvze5QATc9pWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423377; c=relaxed/simple;
	bh=4nAnyarTu9E0TjT9t4KmqJYnnSjORvk/DwzIaVWQvKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnmDZ0pOWvio//ebKQvcYvFyXOMv2Tq75NyS0u1rEoa0Cqk+r+DjycHUvr0Qt9IoUPRTtNxFe4Daffk8TsmXeoRyNE0MIZvAYRfuuu1W/Ceug/0mM4IueQAY/Fkn29l0LhZuEbp2bBKrIuoE03GaD8kVCATqc7lVi7h2RM3jwXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+Go7ra8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so3567369a91.3;
        Tue, 17 Dec 2024 00:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734423375; x=1735028175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPaV8X9Gju5rBvwveUSEw9zum/ptBrQd5kSdpUjaHlA=;
        b=I+Go7ra8+VatMVic9V2nAhLDpa/zxYXjcuAeuXL0hIAt1nidggUlv2IZgGaCpHNYIF
         3YCg+UV1pU/Uy2aO63GjxRiPVkUhFxDAHzGMMDK/QggZz8uPwKB5BC5MsdbOmmWx8QVu
         2NUgODyBRv3ROK4wuu/NpDQk5FAuBsTvm3KM/TANwfYOkqvRW1j8trjIlrXSygTwxjcu
         6qY1N+U9a/Ro4vEbgdweVs35ODh9UUuKp3Vz6xqsjWl4p5kJfW2f8F0aTS0LASIgmmow
         qgKih1Fn1yonEqj40N6NGlU48rUKB0xM4CzJR6MnhXsG0JaaMyGxWfh6SrkuNEjPVhDM
         1FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734423375; x=1735028175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPaV8X9Gju5rBvwveUSEw9zum/ptBrQd5kSdpUjaHlA=;
        b=pdwe4+lCg1bUM/6s6wAa3Pn3wIf6G5LAPNnC38nIVafk3VNUNGYKhNIrLsPtAW15Pb
         bITx0rNazefDJ6wt2zR2tX+KjIwgAflMougXUOC/+PGL1Jm//2nz2XqqLNZwEhMNBTOP
         8dVQ8DKyClQnTCxeP5pPa9KYIvSiOQVGpZdJuzuk2t4F+44/iENLnd68jnWo5qoFcG4R
         3FQMWwjCg/j48WpzRSGGvmbbdGceQYWfpk/qhiawOzCVOCrbh0fD5UqWIdx+cE9JHDuQ
         7vnym8c3xldg8hT66Oq7u9rrfSjXUq+NZyIQPTVAufPlucd3K+ns42IsFY10HyyOe3Pz
         S8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Mfpl8zY3LVAi5U5pnvN1Ue7INw4n+cwaDzw/jT3q96lV848QinXxJhtIrWou2s1BbIOEahlWPtE31g==@vger.kernel.org, AJvYcCXqAR2YH+5rPivcikItjidPPfYtw286gRtCHD20zsabIh0XAYeHm2kEOEitqWFjEgh0NZSyiV3haSyZEej+@vger.kernel.org
X-Gm-Message-State: AOJu0YzBtGR09uxD2YIqJG7CuqVWkvnBWdncwI0zaO+gKIWt87lTe6pX
	WTk79PWexVUx2ji9grutImtX5r0UFug2x9mLTWrvZwQkKfef7ai7
X-Gm-Gg: ASbGncsb3UaV0B46hjnZX1jtUo6gnSeLkcI4X+CxoYDuja4Jxgd1nzfu7HdwrSy45em
	SDqB+HQZ1AbX9Hg4o2ITwz6dzpl2Rhzzv/MMINjN4DLtlpirv8zMFeYR9GGry+kzam3vNKjS/P7
	9OycBD0pHW8v5C3DDyzJM2kATMKqzSSRinvRKdwH2Tfqa+1XQa/O9/QvCAr1Zu+tJUn+xS6WXJx
	7cB9NorIoNyiIEm/mzvpiInFru5iuBJEsVYsDKfrFduskfzYQhJXXEv5V7QrVESIrsLNeg39kSQ
	tWaGDakS
X-Google-Smtp-Source: AGHT+IFE4JRI4njgQNDXFtsdrMEkLX9tzqbmv/jvaGmHgQy8vlu/pU7TTeqAFQQg9sHWVoiitWfWpA==
X-Received: by 2002:a17:90b:3508:b0:2ea:61de:38f7 with SMTP id 98e67ed59e1d1-2f2900a9e73mr24269748a91.29.1734423374941;
        Tue, 17 Dec 2024 00:16:14 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2a2434ae9sm6734326a91.33.2024.12.17.00.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:16:14 -0800 (PST)
Date: Tue, 17 Dec 2024 16:16:11 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH 2/2] hwmon: (spd5118) Use generic parity calculation
Message-ID: <Z2EzS8J+tZGb9Ggs@visitorckw-System-Product-Name>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214085833.8695-3-wsa+renesas@sang-engineering.com>

On Sat, Dec 14, 2024 at 09:58:32AM +0100, Wolfram Sang wrote:
> Make use of the new generic helper for calculating the parity.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei

