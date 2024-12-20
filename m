Return-Path: <linux-renesas-soc+bounces-11655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4DA9F9505
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 16:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B4E27A1197
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 15:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56ED1C683;
	Fri, 20 Dec 2024 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2keYZ+1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFB228382;
	Fri, 20 Dec 2024 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734706927; cv=none; b=eZtLpdIHhD1LhbGZ3OFcT1W/K1TrUT2xbxs43BwUNxDDjg7TFCyTDMLmzPXKkkHak7j/EhKgqSGaU6lTvYzIF+iUgyz7EdP+P20qYJLYtFCO2vRikiaY4Z2xhNFFwkc2ltqripPznlJgXS+mp0FNErQ/1WEKvO8eDt3NwkvXD10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734706927; c=relaxed/simple;
	bh=auLEhUc7qttd2sOqZAEeEyvFLtVMgVE/FVsFbOBviJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJE8by0VOgRlo2w24ykZC4ss9XOq8aiymc7rmwD6s+Y2c/+4qGRXijEk9wPwTOnK4ycH+xZAsPoXKTSHBA60AMF/5S9lSrx2nyOi6J0RbmFzxEgZOjyCcVppivTT5MDfD06/GvLvveyrtLW7mPQnsLRNq0UA1yy1mAQrJCaRn78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2keYZ+1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72739105e02so2176169b3a.0;
        Fri, 20 Dec 2024 07:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734706925; x=1735311725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTyhYUuGNm6UT3T+8e2+fkAWV5OdAvXwUEPzhRNi6XA=;
        b=X2keYZ+1N5wZafy/dBH9UTn2WN/7RizVhe7wnxHmfcB6eYBcPRVgccuTvSDcfIb2qS
         mRQ8LwEXIyezmo3Bk36BZXHwnSJGWL/BWTagoEoxC/i7rr5VOzEnoSplSJ2OM8yeg/am
         s6UzZc/JXO5JijrPgY01sNYBkwQn08uxuNDwyeBrnUlnhYtPO3yDoI8Bv4eY83KHV04e
         nPgN0+hRhcB2bHBoXH4QDK8q/B5UU5ovTMRUiMYSRrH+TciWgsaJrHpDVWjMMWcYeAer
         VLqfFtmrxEJfdkV54Qgx06gVov2bybVyYpOe1/sa8dieNXOXzg/v4jSl+R9MJT5sNgAR
         hPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706925; x=1735311725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTyhYUuGNm6UT3T+8e2+fkAWV5OdAvXwUEPzhRNi6XA=;
        b=xGMvqfoZWlIJdzAUc+A6syF43aMSRkjRsWC9S+YLUEdLCpzkeLB6c0pZ2uNkZ80GWB
         iJKHYrnIYXuOnVvCNxr221wqNj+azsFbQNeHXWY5fYpnNwdmPWQDNLr4c9YQuLAhmM03
         D7ebDurBz9m/Pzui8vUS/HB+SPoVeSgKpP00JrhqXhY9HjDuKdFvp/FGKCZpME6WcxOO
         JgMK+bvx9thNj12GtlD7wdxZ+LN1bJ25YH01EUFlKLcEaH+TLeer/8KN2aUhDoSeE8B/
         tyw2Co0KECM7jjr71K/+gwLmKVe8BvWHsapi4uvsMkV+iYllFZEJi2LBwbsie+i1CWi5
         NpnA==
X-Forwarded-Encrypted: i=1; AJvYcCXxrGjIR1h+yAtwfpbiNIurs/bzhpZupRIhu0gp/Hkdzde0C72AjtJMN3c0ZxHx89JdNO5J2fPuP8bXrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySf0zM8wotiq/s1PxnPe4fh9d5VEgZsdqjC8aXR9lMKYNTAaZu
	zWYfJl6pWCfn+l6W3oxCo3wxyjn7B5VExNupNoMRNNzxf8Q3N86+
X-Gm-Gg: ASbGnctk+wyyuOrY0eSvbC4TNyGVJ/DrlfU2rCdyF0jHw86btKoLP3DUWUYqTcBN92z
	sWgy3xf4FxtuA1rA3nOBuKlXocqjcRD/SSlqp55cx18wv/a4nTtowj7rW9gz+jhVCh7JfyGd7kE
	eAxeqG5DK+Pr8i+wmduIp5NtoR+cvs7aRQEIGO1KjX+VS0P5+QrtGZEjURhw/AwSaUZnCUqRs20
	RLXVW8uOfOuKrQS2CqO1V8Wra5s9OwdcNazHHctMKOjg/NV17zwggi9x/kPFPPM59nEbw==
X-Google-Smtp-Source: AGHT+IEeA8F+0sFtbFVXnyjDPy36vrUl7AUKQiuPuWTEsSgKnC1o1XMt0+bXvqPj2O6ATfDZRPjAuw==
X-Received: by 2002:a05:6a00:300e:b0:725:e057:c3dd with SMTP id d2e1a72fcca58-72abdeb7adfmr4628400b3a.22.1734706925484;
        Fri, 20 Dec 2024 07:02:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad831108sm3188696b3a.58.2024.12.20.07.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 07:02:04 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Dec 2024 07:02:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH v2] hwmon: (lm75) add I3C support for P3T1755
Message-ID: <103fcb15-e550-4d3d-a243-ea3ccf98e76b@roeck-us.net>
References: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>

On Fri, Dec 20, 2024 at 10:36:34AM +0100, Wolfram Sang wrote:
> Introduce I3C support by defining I3C accessors for regmap and
> implementing an I3C driver. Enable I3C for the NXP P3T1755.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v1:
> * don't parse i2c_device_id for a suitable sensor name but copy this
>   information to a specific struct for I3C devices
>   (frankly, I liked the previous solution better)
> 
> * not really a change. I decided against using cpu_to_be/le* helpers.
>   It looks clumsy when operating on an array of u8 with them IMHO.
> 

Should I apply this patch as-is, or do you want to send another version
using {ge,pu}t_unaligned_[bl]e*() ? Either way is fine with me.

Thanks,
Guenter

