Return-Path: <linux-renesas-soc+bounces-11653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FBD9F94F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 15:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D2F7167334
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 14:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48F821883F;
	Fri, 20 Dec 2024 14:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZIz5ml7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2939927462;
	Fri, 20 Dec 2024 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734706670; cv=none; b=ACWmMryBnLke42vB4D4kvVvgedVOdQRNG3aIFcj5MkdDys+pO9YbphwKs2pweVsgSwsSepM5FbA/LRVz9mvWopCV+RKmM1rV/KD6zxAW6nALS6M/437fXeCoiJJGo9TFGnlB0grv5bcLk6IAOBGabfOZ/XE2UHA78BfLR7lNLN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734706670; c=relaxed/simple;
	bh=LcUnP0E56usbryChqFepbojkRSXIBVfnodBQbQs/cYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taXnUxNoh1VcdWKW1MEoUgwQowvOO0n9CNmSqWkvd8Q43S2zIaCKikrGIs5gaw6ybnJfiU1GJl61jWTh8pbx+gB4xWi6FXcSXiF83j05XY+WbKvBYE2QvgDA3BW+jOY2yY9HoalBNs3J2Gp1GvdzC7gtjJQ2lHrJlzh+0AbgBDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZIz5ml7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-728e1799d95so2369764b3a.2;
        Fri, 20 Dec 2024 06:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734706668; x=1735311468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLSMnWxQN7daZGgl9qkufkplue5RDmdGfQDG//c83NU=;
        b=PZIz5ml7nDDL5MabtkUmLtDBYDyCoknvCLJM4IJhLrVn9s9G+/XB2ScwFjJI4I8Td5
         BAtiroV8zKggExdyB1kS6ushA5W5eUUmfmdpProaeFVABU3p+z+1DJ6CZtnWINKnFk3x
         XiR8Wg7gGRXl5IiBY5A8TTj4Q38PNK4T6wJzqiPlPnUgpMpwhe3Lp7pQ4tblv2zykXF0
         a4QAIpZEHTE8hEBRZqugkIJAn5tizgszXfFKzFG0AvDtDEYlSe/FVCGI/2xHLypXiH/a
         dqCqe7BG14KZYF5NE8DWHPxCoNmtUGqpu7dtP9j3fr9XnMxmpjX/10UMJEkTBREaMqif
         CnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706668; x=1735311468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLSMnWxQN7daZGgl9qkufkplue5RDmdGfQDG//c83NU=;
        b=dEZH16tLcHQHUxgw3/jP3jNckLuu2yPu46IV9/ToF6r+ntDkg+NZ2DF+00ysyYeZKj
         Whyc6GE3i+BpGs/oi0fpjTU15LhbFoAIu083LRvi4FfZIdpsS/9+Pq5f2Zk2ecwpb3ry
         6NBzuJ0U9E4Qx8JSiwZXVKKTnMblz3Kk384uhtB+LQnBXVecHHK5uhwt+3Z0EuKN8D0n
         YFcRqDKgypsXVAJFIELU7G6ym9Gobnds4aUm7mw9LOyto1kXQkFRvnOEXmpWjjRImnjV
         lL3VbCYToX+vKSPus0UZe1JO8dZv98wDIgrrQ13e0UvsYPoGVXgLBh79s7RmAqMb8htr
         YngQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTeMzq6JRgWSfFEQ79ywJnjIzxlsm9D9eI9ZEuQEalbnvQD2+p6G1Cdnhu7IH3MDtvBbizi4K0bGi3uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuzyPKrBxE//350OyKlEh7f768oGNtun7heRvVNoAOnfqNBdPI
	f4GOep+E6Upys0Vr9ghDxmaH5AT6KBUXZstu9PbxDT9cWy4FjafS
X-Gm-Gg: ASbGncvjuiqY1dL7ihaTiGz+NqRIt9GfYw382rE3DJbApwNSRGIR63Nh4auHr9L3RXV
	bGVFuQOsE80TX3osauQvvix8WHKZJbVs8l1KZVqKCiYSfN84bDCoicNfdikJP6E4lSPzW1enJ+2
	2iNJVGEYhGEtBybsNXgLk5JQIiQ9QEQx9etEgsb0ypsEGtFGpSS1LrTKOsIlSKuqNWU1unvdmiL
	jBOzJXydFBf8+mDumiHOHYZ+oAMeeVhS6aafi32eWcUSy/VY1ejjsibSLp3vwod6630bw==
X-Google-Smtp-Source: AGHT+IFYHDUg+fucYdi2uCdlRtRxJmfmOfirz/X6Xh27SilFgvYC3VeZUmDaruQnBV7rP2nDNQrVdQ==
X-Received: by 2002:a05:6a21:3994:b0:1e0:d867:c875 with SMTP id adf61e73a8af0-1e5e080ab04mr4978192637.36.1734706668384;
        Fri, 20 Dec 2024 06:57:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842dc7eda63sm2949126a12.68.2024.12.20.06.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:57:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Dec 2024 06:57:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH 3/5] hwmon: (lm75) Remove superfluous 'client' member
 from private struct
Message-ID: <b4e01f36-75ed-4249-826a-357e53fae63c@roeck-us.net>
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
 <20241219225522.3490-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219225522.3490-10-wsa+renesas@sang-engineering.com>

On Thu, Dec 19, 2024 at 11:55:25PM +0100, Wolfram Sang wrote:
> The regmap-only conversion allows us to store the client-pointer as the
> 'context' parameter for regmap. This not only makes the private struct
> smaller, but also allows proper separation of I2C and I3C in the future.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter

