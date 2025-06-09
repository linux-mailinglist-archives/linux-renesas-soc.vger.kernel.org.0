Return-Path: <linux-renesas-soc+bounces-17996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A483AD28A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 23:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F1E316FABB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 21:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E12221702;
	Mon,  9 Jun 2025 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zf3I4Jfl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C2F21CC5F;
	Mon,  9 Jun 2025 21:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504085; cv=none; b=HM46ZLvpmnCQIdVad1jj1laIQnKlrap8m/ZcSKPYNDOo0iB/u7n05SkqnuV0wi/4ahLuncRnhbm9ts1/mS9H526GqCdnCe8ci3GlxL6/EXczeUwV73v+fAc4znv8SQM9+Z+jvIBbhYPmF9apI2d3Ek70fERbpoCCLiD2m4UldHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504085; c=relaxed/simple;
	bh=O50h9LEepqZP2XcuHZKqPVqTWPHeh+PrpxgNuZr4SM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ri4a2Mr8THhGwY+Ejk4sOsBHhf5D8e4yk5aOvYgcJJ12a7mK69V5JHWjPCUIXeqgCTrlflFpRImUA5PTRRc7Wi4fvvA4xyyaop90yCVrDTQNckv+VA1NQzdGsX7RBYOXp4OvTijNtRW1+d3YmxiPiPtmzA84KA3tCezjPI1qGIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zf3I4Jfl; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235e1d4cba0so38003705ad.2;
        Mon, 09 Jun 2025 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749504083; x=1750108883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JTw27oqe3wLm58LaA8AEVNRZ1OUXdLMUSm5hkYQcLo=;
        b=Zf3I4Jfl7/aSkUBj72Bzfq1VdQeZiFx6ufvuWVHMHXYz4QdI3D7PexZJsEXp9uyGFA
         nXCtUSXosvSNYDFA3lD4tKljGN0mt/kmx1Jebse7QZuMjHgOfWkZ5fKM5kuRw5ztpOS6
         4NBhRreJrjNDM8MsNuGRDD0z3wLaB34fFGJ/hShcTS4tGCeS7lpjginHVDKRfV8zYlEa
         jm6N7YbqifBKC6F3/EDI+wgr9KSYQWzw4EgZbnlPvUsJ2dWmcOB/OQmSxtTX9hqciIW6
         lGMwUZEZ+n37W7byqkQAwpFOgwiOkRHj+mJeMkT8jKEW6Dlia4zG1SqodNs2bMhGwbC3
         aCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749504083; x=1750108883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JTw27oqe3wLm58LaA8AEVNRZ1OUXdLMUSm5hkYQcLo=;
        b=bkfNr1e7xJ+4kNUsXQrngqu7X/nUWtbZmiGlC0vguz9wO2xlLhbBUjINVibusV3YAn
         wKWyrcHD2hOsk26ybMY4ymEPNUCRCPUzEC/XvoivOX/IH5/FdNGgYzhgNQ2jvQ5F4YCY
         pn8vE+o4vxvrsBMdzYwTxlQSCpLEsIw4LNe2Hz57STAb8B4ai7vM3r/iFUKR+fpS5sW1
         neLdAIQ5om6mD1bTUDixg5P5tV/PLe16UefX67fH3y8botKUTOuklOBq2VaWNJfiKrz/
         /y2bnHBL5lPigK4hE453E2xxgbA0LzycQ/BczTnzvq0eqSG0x2vmqAiFPpImjvWBPbWA
         D6ww==
X-Forwarded-Encrypted: i=1; AJvYcCUekO3dijcW2GWp4HEKHJzXzgmttD+f3drV6Pf4J0I9YOiyOnJYZDdc/q968g8+kQqnx8K6Io9fsxSXhJFtQoG0Lpc=@vger.kernel.org, AJvYcCVG1dj5umrPKLLzQBHO+UmLHTpI6o/p0LMmucoy5FqmPIMW0Ccw2g9CnkkwzS8xqEFWRg5rC4pSswfb@vger.kernel.org, AJvYcCX2ufCCjTiHUzlCEjpXNeF1g9Tqx22WcZt1YB/JCt7aHrN2nrwAIo3bQt7oXQYtisw+6S0Ie6rb+qfSY+0=@vger.kernel.org, AJvYcCXNjuyFHhDfKTuM+kCf9elCPwqFtE+lKun9uYjk9o5oOE/e2+E5ssIJFBjIWFulIGxK2VvncQ2KnSuSmI/i@vger.kernel.org
X-Gm-Message-State: AOJu0YwS517J2hfRH3MQBq+o9gfc1WkqwXSpz3ggfcUbn6EtmW00VVSF
	dWq9M6nWhuJFOr3ggnikVmSe5nZ7DsfqdOaaND9q1ozVneXC1WoI23Gs
X-Gm-Gg: ASbGnctKXtuFeA+BfWWAmrmNYOoIfTrqXfTPkFHaC8h/hfYii8Yf8jDkXp3wpM8DhvC
	ypGyd4tcbIjJA/+kIGxGehZ9IqXLkwUaNFschkf0Y7fq2rP8aPSLOZAeEp0a87h6kKQEMtQZJDP
	7Y3bbeZGXX8kgtoeORXu6OqPHZa+7Xcb6QWjP7ScylpstH9xZ/hq/J5Oq5DCIMi/q+WA3B8nna9
	xy8lv56isreNx4UdRQBDFK2zFDIaybLDqh+KLZGx5mShyL2mtcrbLdeml1N1ybXzJZCJbZfcuRE
	oQiE6CXM6VMW64fY1jdG1+hyp4q9uqBxF5NggumitTj+kgD758Dull74OxgMWEUmoMPCqB0zxw8
	=
X-Google-Smtp-Source: AGHT+IHyqz8YAHVAeegO+huCcmlZjP0PWjX13aug+4AIIyiVO+2ZxjDg3pQxqBRI6D6kSBJA8ma5Pg==
X-Received: by 2002:a17:902:dac3:b0:234:cb4a:bc1b with SMTP id d9443c01a7336-23601dd8a74mr212301085ad.49.1749504083046;
        Mon, 09 Jun 2025 14:21:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340519fsm58825325ad.156.2025.06.09.14.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 14:21:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Jun 2025 14:21:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chiang Brian <chiang.brian@inventec.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
	geert+renesas@glider.be, grant.peltier.jg@renesas.com,
	jdelvare@suse.com, krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: (pmbus/isl68137) Add support for RAA229621
Message-ID: <dc996bde-6cc1-4010-b9eb-e4c2a969ce46@roeck-us.net>
References: <20250605040134.4012199-1-chiang.brian@inventec.com>
 <20250605040134.4012199-3-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605040134.4012199-3-chiang.brian@inventec.com>

On Thu, Jun 05, 2025 at 12:01:34PM +0800, Chiang Brian wrote:
> The RAA229621 is a digital dual output multiphase (X+Y <= 8) PWM controller
> designed to be compliant with AMD SVI3 specifications, targeting VDDCR_CPU 
> and VDDCR_SOC rails.
> 
> Add support for it to the isl68137 driver.
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

Applied.

Thanks,
Guenter

