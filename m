Return-Path: <linux-renesas-soc+bounces-9832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 723249A3089
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 00:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD45283E13
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 22:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D381D61AF;
	Thu, 17 Oct 2024 22:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlY8VYCA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B81D5CD1;
	Thu, 17 Oct 2024 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729203706; cv=none; b=CSZTJCHG6bNnb6b/HTcTilBZaDOhgxeuvzaafeMU0wCqEqltrEs3I9SLJ+ku5XxSttDDccFC/5niamK5Yik9B5Q1e7YQBi3Age1F+EJNCEXXxYE/PQyMPyfi81RX6Ly74tF8OdPp9S2/d3YrYV24AAMUFOyfNN58iOOiSwnHbnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729203706; c=relaxed/simple;
	bh=d0oXxu67eK6Qedz4ImrRGhg5SACLuT/ELAj6jZcK7cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuS2PF72f8HpcTXCtkscQ11b60vatlvyIxNC51W+3Gn/aCyM4R1oDEOrl06jFi5ixzcRiGEiL+kfZ7Gb+daSvK9cq6h0g1QU6Tp7P464qHWF1vwSUw9dLvjC+FggsS9gqKYORUzvIyFfMOvo8UedI0lRCjwaxm0blp61D/h5l3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlY8VYCA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e52582cf8so990834b3a.2;
        Thu, 17 Oct 2024 15:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729203700; x=1729808500; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Syu2lHE80nyNUYkktW4dSM8E4AAqFFfdoL2Xal3TXfw=;
        b=OlY8VYCAH9HVS8RSJf4Q5oCAX4yTjVMYvfThyYkCmAO9/zDqeBqcgFXfIoKGGakKei
         zn4dUJpPiur38zDG4qTzZxqoGDC7VS6E8HMgGGinSBMC3R3ecFAdcAtnjdnyMVuWVddm
         zSIlL9kohE9UWkV7J3jzVCB4c5mRdlH14hKFVU5L7J01cS16Dc2rIMNQG08KJoGp8TT9
         g/j9WXOOwZzoq6CDzu/bdky6xYPaDrj7trcZi1730mSqTTi9/A+bMsBYT/T9PrZsco3m
         rZ9I/J6NMxhqjhi9nd2YiZZ/6FVS88mX1AESR+xSqw1SPyac8ch7yY39hO8zOSI9pQan
         b66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729203700; x=1729808500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Syu2lHE80nyNUYkktW4dSM8E4AAqFFfdoL2Xal3TXfw=;
        b=RhBm0kNRS7FUZDqk1js00vUhrr+RYLkBBiKlPaswLlb1gmsF+P+jJwp2Yid0GXimGq
         2kUt1LgqX/Xg1tTw2wSqXpBsPXwkXV73egkQz1AaHV/qEE0VxFRjhFnEkOS2Yt6MWGt2
         +2kR4Paw5b4L6t9yVApN6X/b1cre2DqyYkNfZN7f6H5mUrJY7wgiY1Tn6uAANN+Ncrmn
         MAYG/E6uDnZ4ys/NYdCXAPn279sBxDU+AM6mexKhLkE9JKyHkiNqs8AdM+OHuv8uz6AD
         MNKNqKG+soLhvYnCFCCUvyZqfrth5PSDgVKLVsMI6MZPd9Cbn+41H8PCypfTW6waQG7o
         ek1w==
X-Forwarded-Encrypted: i=1; AJvYcCU97O/EcFkq+G3B+IHEFuJ3/x6AL1MOTdzHLrnCtau/P5RteCiDKISZefIUSatE3pWUGpRMJGvAXSJcDxif@vger.kernel.org, AJvYcCUPaBzxYgaLRN8R6KeunlkM/RbbXvyYqFm2HcY23h7ZWUnW4RjVdZbowcsedb8ntj0BYcig9apCp58o@vger.kernel.org, AJvYcCUmXE4DCVzTabwqRgqhBVkt47zcwET+3chtCmFL4i/aO5AjOioMYeh7KjpxQfC7EOOOKKrwIwy0lc8s@vger.kernel.org, AJvYcCXPOTmp0xD0bN7KM4EV9FF6t3ZGIKSWODAmQ8FbT40/ygQywrNd+wsZ0SKPke3cNoGoQZgZUPFNmE2xG1E=@vger.kernel.org, AJvYcCXzzD2E/9y6b8NZeqOxSUGvPM1WUdFOAbXQFXEtdN5jW7kzQ4Sfxwskqxm9mBn/dQE8P1SMz47d3RpxKnAsRfvD734=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNYPBACbMX02mCX1icTUUQkzCte2LELaZhb9yBazEK5qKvoFy
	sgSrGkeFeVmzB7nRH/8sMJ/c6bebl5+8n1hD0tURPLoJ3lbGvkK5
X-Google-Smtp-Source: AGHT+IH9nD34IZIOP5PVkdMu4A4ajuomnJAHBxpfncOr/tYBwSJ4yCRPj4p1QIZaHSgAJCdlcrBI1A==
X-Received: by 2002:a05:6a00:2ea8:b0:71e:233:9537 with SMTP id d2e1a72fcca58-71ea323c11cmr672360b3a.28.1729203700392;
        Thu, 17 Oct 2024 15:21:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc28d374sm106152a12.71.2024.10.17.15.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:21:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 17 Oct 2024 15:21:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Cc: patrick@stwcx.xyz,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: hwmon: add renesas,isl28022
Message-ID: <5619cd26-9d09-40b1-9138-238b362df8b1@roeck-us.net>
References: <20241002081133.13123-1-yikai.tsai.wiwynn@gmail.com>
 <20241002081133.13123-2-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002081133.13123-2-yikai.tsai.wiwynn@gmail.com>

On Wed, Oct 02, 2024 at 04:11:29PM +0800, Yikai Tsai wrote:
> Add dt-bindings for Renesas ISL28022 power monitor.
> 
> Signed-off-by: Carsten Spieﬂ <mail@carsten-spiess.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>

Applied.

Thanks,
Guenter

