Return-Path: <linux-renesas-soc+bounces-11652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 258ED9F94F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 15:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3952D188C435
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 14:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8343B21882F;
	Fri, 20 Dec 2024 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFFaJ/My"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C542127462;
	Fri, 20 Dec 2024 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734706641; cv=none; b=NkRj3tWor0P5Vuegt9IulZ7nY8Yi/jgdyp+xn0og2cm2L708J2RIk7gwK/VtUECf4vJZddhFyeJnW4Eriq6ATgeMWi1eu2QhEVYcjwJOfK1iM9hIaZURdkO0XwGfCc/SPT38G5CZxnsgDWlaKkxE0n7pH7YF/Jh2SjglDbdO0LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734706641; c=relaxed/simple;
	bh=Q2UFg44fCwexWFnyMGlSUF2FlUbgpLkl5F4M05IIIZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wygbqj1Lx1p+Iw297wrwGBzOup93yxZYDzx0dgV749mdU/EWdHZ1M13Km53oImLrik3ow0mTYW+2e7Xn38IbcYaEiX6HukCzVwXQ7t2JYhHP3Bp14uhvsbKuibYyp0XmzebfsY88cliTzuIXtMyYduckyaKM1OZToMknly+S1Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFFaJ/My; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-725f2f79ed9so1705262b3a.2;
        Fri, 20 Dec 2024 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734706639; x=1735311439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCiIdwNwZJOTCxCVKpK1FiIZj0sOPqEHzSlV8dTIl3E=;
        b=XFFaJ/MyBJ73PPYF37N7ibmUi5wUSN25csB45tTP4Mydd7YCt7CAIf6pcmW2WIlcTO
         4KqT7XTXeXxGfEYP3v+PwcUf1EQVTsvUrpKZy4fjRQq7jDkLZBuDXpbrxWoGXhVhUdXu
         LUawSALVbK5G4opLSA1wGAed0Ab/UCQ+T/rdlYrjmjBjRdi5VUmcl1HV34leL4Grvtpr
         gBXwtYj/Q8lA6iqWa0i4owI6VswXCxAn2nTB4Jl/xX/on19f3eVkJ48VU8tc+6RJX0QQ
         Xqz5Pl+AtU4+nwi5Z/vQBe+jUx9G3D4Oa1ghMn4U8KqulXTRI+Yg/mDJJhhvo8rnc13d
         M3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706639; x=1735311439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCiIdwNwZJOTCxCVKpK1FiIZj0sOPqEHzSlV8dTIl3E=;
        b=wPBCiGT+WmD9Fgu5l0J1gELjkQS5MpX10hRgwbJZ3+jvjLnXACjGoDwHo7N2fIfGPM
         y5L67Ba3BEMl//DU8RH7jwgoeyG6iknJPHe8/yY7yHGR/HdW51YcDwM0NeXhIy3lOI/c
         0XwK0pMLpaypG3qPRJ6f/gXk1YCHoOF5dYjQUndDlzlU3aCTzfXIPRe9EntNc3UVCrTP
         uiE1KEZ0pwTSbfD/CRj3E1a6l6pmXsjCOeCFyYOixAOr20mDdenZAc2r5ji4SAAyC4mt
         ooeJnt5lHdbpfj8Q5UGjJAIwkTfzr3VKSDVVpWdhmXyqUp9962MSg7XOGUxExJMc2sxQ
         XdSg==
X-Forwarded-Encrypted: i=1; AJvYcCWDgrRJ4Exj7Nt+rGC3oDMshJW3g29RXgQG0T1V4HPdBT5xrSSyJlQRCDMLgs0zLi6XXuvNjHSJIrDNpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykD92RjcLWBs91M4gM90PJXOXb4MupI6+lHL200UK617a60Ow3
	l/4vIy9lLZaekXUSmpxBFpef1nqFDz+XrUYzFgpQG/yWqSoek1f1
X-Gm-Gg: ASbGnctAtutDfbVP5q7iZ+zxMVojT1UGoZZ3JrqYaFJE7H2DqvUgw9NP45radikwlAF
	qWv4XsJFolfrlNJDtwOLMRFhCnmUM6cNyYf3bqwOTd3WE+FA39sNZ7CSrZiuQgdtwQm6xFijJsT
	roFZM0DA8w0i6D0AgnAYjYI8Nb3Bou5ZPBj710rclM9I01Peo0ecct+vJkIe7cI7axjCa66LrWX
	xBTNDihUSdPeCnf6CiLiDOE48EnKqjiSejo6qUeKJdC1QOc0VGnOwNpIcGNtejuQ9dEXQ==
X-Google-Smtp-Source: AGHT+IEySfJUeL/JEPlzsW4+Jr2v/iYZ53N1f9g+Va24yE6KH2oSDHGewo9T0s7N6+mLKzzKpRm/FA==
X-Received: by 2002:a05:6a20:a109:b0:1e1:96d9:a7db with SMTP id adf61e73a8af0-1e5e04467e7mr5815243637.4.1734706639058;
        Fri, 20 Dec 2024 06:57:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84877bsm3182910b3a.84.2024.12.20.06.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:57:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Dec 2024 06:57:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH 2/5] hwmon: (lm75) simplify regulator handling
Message-ID: <b6672611-2558-4ebd-929e-876be4cc31ee@roeck-us.net>
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
 <20241219225522.3490-9-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219225522.3490-9-wsa+renesas@sang-engineering.com>

On Thu, Dec 19, 2024 at 11:55:24PM +0100, Wolfram Sang wrote:
> devm_regulator_get_enable() was introduced exactly to avoid open coding
> regulator handling like in this driver. Make use of this helper.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Guenter

