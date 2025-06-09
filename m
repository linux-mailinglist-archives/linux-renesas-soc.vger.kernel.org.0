Return-Path: <linux-renesas-soc+bounces-17995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE17AD289E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 23:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23831887334
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 21:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A826A221289;
	Mon,  9 Jun 2025 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWTfxZBt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A419EEC2;
	Mon,  9 Jun 2025 21:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504039; cv=none; b=WIX6HN5edXh8QbY8vuvXBDMxqe547gG/qZLDHUOuEYmvlYFvUgCVHlroFZnvSow/HaoGCE02v4iEuG8BAj0W+yXC7RHoFS83RW8ntdlZwGvp5kDeuQnE6C+Vjw5coR92mXFtgAKS4oKAv/+ZDjjq+kzTP53axD3xXNvtmTzmZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504039; c=relaxed/simple;
	bh=FrQsq7t2hw7g128mD3xAsli2xzZboFnvTm71Rb1PQ/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QANWOX3UP21n7iPjWyKd6v62web4yufjIk1ROpz8uueYB+Q9731WskM7Ay1qlMmLaCCd4UxkWbiN9SrDkURefxp5jTw4SNq8OwHQ1nRumv2Zy6WaOPlN2PqbQ/wUnilnPpDH0GYh/iLAo1WqrYOuEJWmmqvRIwUBOZ9Ctdv5lAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWTfxZBt; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7482377b086so2338012b3a.1;
        Mon, 09 Jun 2025 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749504037; x=1750108837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11PrEtPt++0O0lAJCVZi/TQtMPKK0E063CZMQX4Xkyw=;
        b=bWTfxZBtaJ5WSo7jXQmQuRZU/OUtMD4n+sjXidot7abWflv01hHpXZ2oovCQ9tKsQH
         hbK8ewM2YVmy5urbs22LQnf03JbnSwHb4U2OyVmBGhFuO8noyxtOOpJNdtCOIRdsQszC
         jzu61Q7q9V1//+MSE2MOVOqh5xyVGChTYhSAHzNNydNqOZsb3LsRvQ35uY/DM0wqxXJ1
         c6GahaSykZCUgd7ck749ATSYBrXwQ7FWiPT7toVxSj/9pHyUJl4GW56uRPK1xE66tyMO
         TL1TihOxjDV0N7gmsxd5eOCeMEfoazqk/sXTCJEhU5igFxyAbq3QioEOjvI8dbn8sQAq
         BOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749504037; x=1750108837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11PrEtPt++0O0lAJCVZi/TQtMPKK0E063CZMQX4Xkyw=;
        b=ohOpgi1eW2S/yBY7n1dI5HzbdjQFRkIP84i/DZFO4NdXEz4NyZfrXcYVnJ/JP3h2pi
         LkiCxtsmQJKEzJpxuGq9ukjJTKKeImv635inXd3+kO2/Zl2jyRVOReYOGSCP9aQXCc2m
         cICIVedipKl+iXb0E5NODWxXtiWk9PtKo1CSr6V527RWR79d29VTggGJyFaN1vCWJUKg
         hRkYI+MzFh46IvgY0obyF1MV4ki9Uc6ho4huXzmx7uR3BQ2xlYVPnyg4gCTbMO6QoCpN
         GxkBsTcBN6kUvdiSpxw8RALoTX07p/r2ThAwcENCz9GdirGF5BthJstgAtUsqskOUrG7
         FmIA==
X-Forwarded-Encrypted: i=1; AJvYcCU/JcmGPrh/yHmFfm6GiaR3IVtXtskPstw0rG/Q203Csf6rpzVLohJ8HupRQiR3rzYvNin6vNEzEfI1uz8=@vger.kernel.org, AJvYcCUjmfPUWOG+7YJRYaebzBR+MfWcaHragUX9FQDl3OGlxBCriwoSUvm6R4HH1zDDDw8cCrl7vF+sE+UW@vger.kernel.org, AJvYcCW72a7/oVdPGDpwnXpBZzCDyjlSMGvC2danSkaSFkwoEcb1r6ArKE5w67lpnxVePKpHgQfHynSuPKX+3YZwo2cg18o=@vger.kernel.org, AJvYcCXBTMr5KMytSkJSpE7LzMchUhbQmV8Aa+YFZV9916wPzXNY4y+t6gen3EHU1uGRXXPqPS76Z8N7aQ13OG4p@vger.kernel.org
X-Gm-Message-State: AOJu0YzYWY+cc7GwkWRr6A/eCEeyH0rBvoV3iipuhfANRoiQBD3U63ob
	uPMsGMGHeKRbJQqzw6YXzf8g+eaYFGnXToRac8WfZRECkJHEuSK5If8k
X-Gm-Gg: ASbGncsF3rwPGO5sx7iPHW5x0jWK5950YZPf/n9J0xCsUAKGUdEzt389MUuMUvNpMym
	IsIsCq5wglDgfucRqBvtAcIhtMa5f8kVyHO59GiX0Ve1iAvcxfWVDCHHQtR3/JmBwmjmSLG0PxD
	kDfFqih1d0Lka4JbUfzX4M+4+qFDgPs9egNCbLNoQb5LuvddhDY9evR3cDFIr3iYYbzniR/68DT
	lw7MIVOkwnoz4/vBQIzBqqUbZawRiXaGDRPXvrRgwm7zlq0iYRyzMt33JM2dQsnlghyhUclK+RE
	GrzOs63cCuzrcR58ps6sj228V5GNXYAHNGEijorxjPqYc2fsgg2f3iWyI9TIMnlXRL/LuiyKprM
	=
X-Google-Smtp-Source: AGHT+IGjp/DjneeoG8h42ydOn6kwUzPr6AHymGvZedg7KLkT0ddsktmtCIsC7UHJ9ISlKNCsJJerEw==
X-Received: by 2002:a05:6a20:6a11:b0:217:feb5:631d with SMTP id adf61e73a8af0-21ee25d88f8mr22948209637.26.1749504037432;
        Mon, 09 Jun 2025 14:20:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ef824a3sm5697999a12.32.2025.06.09.14.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 14:20:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Jun 2025 14:20:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chiang Brian <chiang.brian@inventec.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
	geert+renesas@glider.be, grant.peltier.jg@renesas.com,
	jdelvare@suse.com, krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	robh@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: (pmbus/isl68137) Add
 RAA229621 support
Message-ID: <7ead5cba-0560-45a9-8d10-3c13747211ad@roeck-us.net>
References: <20250605040134.4012199-1-chiang.brian@inventec.com>
 <20250605040134.4012199-2-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605040134.4012199-2-chiang.brian@inventec.com>

On Thu, Jun 05, 2025 at 12:01:33PM +0800, Chiang Brian wrote:
> Add device type support for raa229621
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

Applied.

Thanks,
Guenter

