Return-Path: <linux-renesas-soc+bounces-21532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E2B4652C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 23:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBABA3AC19F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 21:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F9B2EB84B;
	Fri,  5 Sep 2025 21:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec9Z9Z+L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84E826B764;
	Fri,  5 Sep 2025 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757106468; cv=none; b=VigFRnzloMyC4FSanf4tWIKnOnwlxvLSjLCQSCHSyvQS69GYf86HljPjKtKBVrkrr6cd7DDDHXGFPpuP2nhQvQ4739nAjsyrDJ+vql8+sUuRRSGSmyLGzRSykv0tO9mNT2aLVjwGl28o5nn4JL4rt1tpoR+cSi+rbkG38tPXWGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757106468; c=relaxed/simple;
	bh=3843Vv8j3E5LWD3oStta9RcM6gyBK20cJn58+zi7pbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE/KPAaIsQUtL39+r9cODrCS/NfgBiVrt7vSuY3fQBsvHTD6KmS1uCKHMdhQowfXiIV02M1qgvaXz19DoQvFbXafo4WUxhWTykgi7omaGpiTE/TRfXaI0sR/XQM7c5hR/TpIj8Ea6/qN2+SVsm4R2wZluakE1H10GQsdyxNICWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec9Z9Z+L; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24af8cd99ddso33271255ad.0;
        Fri, 05 Sep 2025 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757106466; x=1757711266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OraY1KDXG5tLpby1/MhWp3WoQzDbT9BWKJqTltJE2A=;
        b=Ec9Z9Z+LbuapUdDoYXfnqUM6p0W9JlcMSre+8MnlE1jdagKpb9qpJNFW4FezL63k6h
         OSpni9nUXMJAw+d0ZhdfDEmpQsBFyRdWzEx650Ajp8HFslSso7YBEtkY1GU+nNan5jHK
         ZZtsMZ30hDo67QYC/f2oTBk1d0DeajEP/fk/ATJAk4iVKjjQLWi2+wpfehKKIQEefzhw
         5cEwnhVEcCD39r0oiAPglqxIyMz+dkLBA9w1hKaewrOFZTN1wyrEJ65XIG5CS/6r1IL7
         zX2gp4fC2H3HCmFOXw2iNQahRd7G37qR1kWIDF/S110fMLgSUwaz43EWcGQSlyB/HMh/
         jBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757106466; x=1757711266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OraY1KDXG5tLpby1/MhWp3WoQzDbT9BWKJqTltJE2A=;
        b=pkucLRK1/rV3LDJW2CbIIqeWlRAtL9jLCIAiuyyEc3cKUl5vfibg8NRhLj95mOiZ0j
         cnts6j9j/qPkkvQpVjyWtFsRViqT2EcvNyL+r0AiH0ug8DiCnFpm02elY5c4bjHlUIq0
         aHnJtYBeyhGj6o+kun6Zsu4ivAoaNTtg5QeSbve2ZOBO6+Jo/dR9WRCsGQysYwTekPU6
         BwHJ80yn9ao8IwJXgM7mIYCxaEEUDRDcDWFxotRqgKBNj+CVycZUIrY11Xnhj7oxtnIA
         Slg37PFjJnnqfdZDytGkBmE4m2O5E1bqtnkPf/4wsU2576O2BUsV48vpZnvlCie3iu8p
         FTSg==
X-Forwarded-Encrypted: i=1; AJvYcCW1zbpT9OB9Dmsb+d+6o6rDxAEFwzUxV/apy6YuNvFwDeLgezk2nwkBhP/sEHgn0x4ITKBKeaPST++6@vger.kernel.org, AJvYcCWjPcmR9IzDouoiyY1DnnSqq0XCzPCQjyXjF8k3qKMh13/QHSFG6WnjAu4ONr5pwAv/QafWGg2ngKw15jmYdY0YDik=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFpcmLmsDOa0LAXmfn+KqPM1Vp7JB9sVwynVg8z0kQX68o7eFT
	hggb0AozE7jHnSLqDEGIl1ta9r4OuWo00Voj7uXDJ7jVJmSxjsYAAPAZ
X-Gm-Gg: ASbGncsSLVQapmbWIGW2WO18jq6jak1JS81EMKeZW5kH6/DQV7TWCItCkH8a/97CBjh
	iuJ4aupUwU7EVLYrXHfUiqOyfB1P3oa2nuJUeNPYuJ0TVZF8hhumihDKjejmELU39ysGXeZxiE1
	0HX2pNPEL8M6MzvAuTi0uTkP3/1f4iO9+WvwXfl0/bEOLcwfqD/34dheLaD7YW/3AuhFggbncY0
	Zqu2tShYXpwfj+JDD+s0Kj1S4plM/itnrnjGXcAMiZXUPqdVtO6Cwx0o+LbOe5P2y693PtPwGqT
	5OdLzh6z/aqhhpMPxLqk2KmJGMq9ZJaGC3tYF3/HBCUcI8RL4B48al1AFzixq9QwaKrK1SBRhnN
	eONMev8YAkIJRnbok0dwTuCJDMm7Jhv89Hxn8UgTdWa8UPA==
X-Google-Smtp-Source: AGHT+IGS+ZDno32/glJ5EVArsVb5yN5iCNRV9PGoMVaxuwRlAOth3oklD9GFJuwyHCCgQsE7qY0Ysg==
X-Received: by 2002:a17:903:2b03:b0:234:b743:c7a4 with SMTP id d9443c01a7336-25171cbfd83mr916675ad.38.1757106466161;
        Fri, 05 Sep 2025 14:07:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc56e7esm46452545ad.58.2025.09.05.14.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:07:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 5 Sep 2025 14:07:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-hwmon@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document after
 shutdown fan settings
Message-ID: <7c2b7c73-1955-497b-81f3-3b31c1f1f2f7@roeck-us.net>
References: <20250904202157.170600-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904202157.170600-1-marek.vasut+renesas@mailbox.org>

On Thu, Sep 04, 2025 at 10:21:09PM +0200, Marek Vasut wrote:
> Document fan-shutdown-percent property, used to describe fan RPM in percent
> set during shutdown. This is used to keep the fan running at fixed RPM after
> the kernel shut down, which is useful on hardware that does keep heating
> itself even after the kernel did shut down, for example from some sort of
> management core.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Guenter

