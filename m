Return-Path: <linux-renesas-soc+bounces-28357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CbWItzImGngMAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 21:49:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B3016ABFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 21:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A66E03034DE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 20:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C7F30BB89;
	Fri, 20 Feb 2026 20:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S75FK6cv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2012FF154
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771620570; cv=none; b=O0HTBtAA22rHBjVjCuKu0G+mUKjCNH+S5AB9gjl3YJW7+1xmO8nKu6HPaFxTNI5v1HzwyMakOmCbSRhH7Fk9hdd+4nCUoHzrT25CqXaoDSUdHvQtVgutp/Ysyj1qe/LwTT0tI6D1eLyNSMc5eGT9+Z/6I4P+3wz7TzDzaspk/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771620570; c=relaxed/simple;
	bh=flwg3Cg8CqkjX2Xk3RfS7vZeldonOJZHQD8B09TnYdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeNcKvkPiGhsnUAYHo9gDlLKeyd82oQ3ZrfWEuIQothbS7WKpv2y955vm6a2s2OifORCSIA9NKYEVpwpEO5vSJF57CVlkgM3fXnyV1DHY7zRot/YpkZjYEBrBeAR+MwUmY2f2EYtmoMli9zFM95iHxcPKD3Fx3lh0IRAdiK0hJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S75FK6cv; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1270adc5121so3170816c88.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 12:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771620568; x=1772225368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hG+wlknKI2i2FvW/8fhyL8NFzyl3ugIODzwBYkDCcS0=;
        b=S75FK6cvRm/vVVyzwJARQUUD1XHnqB3esaMBsOMxRZ2jv9XtoRAQJ027PEHu6Pw5d6
         bAJMUbYelZuaZcGh8NoNSph+w30sZa3PnbXQVqKsCufCfw5ZP8GlAVKb/incYH3VKKmB
         /ChJ5uP7T0Bh+rWw0iQ0yLQZxr1rzNJpyRLhbqRsRBfS9/3u/80YBLE7YjLYghssorHr
         8lSeTn6mxmeqe2+jaqMRYg2V3fAsq+MQan3RKWpsN+3jlh7QZlclYRmcujEshhnKUK0G
         VOsZbuJM4tTvbpkgTUOpqjb3a0ZvOSqi7d+KROz7Mj16uNhIzVyDxvl7IhJcOOB9A6Zg
         deZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771620568; x=1772225368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hG+wlknKI2i2FvW/8fhyL8NFzyl3ugIODzwBYkDCcS0=;
        b=B/IlhWseu6tpw91adMGv01Zy2YhmNHwp++l7djMY3n5rZ+OlSPuYBNWmtIBX+8xcy0
         YspP6UYj23yGeqcppb1h5EVTbJEdQkbUI9qIMmYKxD85y3HkAxjvPKxhroa6xvZe9cR3
         FoCsYvmAIjvMB3CA1JJDDDlb6v8BUvqUhR3m+5jbc9CT7cgzmJNavlFNdkmxR82BQWtZ
         iYXiYRHCS4cU6Hfx3ahyQg1RwWtWmr8m2U8CAPkeLP8to+2i05DEwBJU6fBh8bZ6MtGl
         dDPWNRymRKwC1KbwhOx2a+anp6a5T3jKbBz2o43vPOnhKfGAVMXMudsPbro7PBUbXX4u
         YlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCURB7uSTJ2/BrWozR4PujhvmhtAtu7gZ8pywXIPufRYVFY97pAgXSX9sx9a5vsmJoNN0Qb1DumkbcKEWTtE4aCDpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMrlaZ+N1GVvLZ2AnhAA96khQ6fgacdVDYZRCv4Iepi8h1tTxs
	UU7Qp19FfSnnP8ghEV7q0eMWm5CMSc/6r0haQoQqZMa/gfdbE53jrGwJqOWS35BI
X-Gm-Gg: AZuq6aJBvlvG8o55QyUUPy6LNCAeiuIyrg6VoSJhd8Z04Ovh/BFfSrVgmbXhyxJW4yc
	SCWaLb7mWTMMe3qBNZkBm9MyC5FvUgYN+g1BUL9WoAvemGxpDRhpAUEiphGKfeJ5r2SGJB0Viiu
	kUeHOZPbMLL8l4I+ypaGQZDfKc+aTyiJ05MBDDTr063F6Ipx8Sdh8R1ZNdOEGRda6yugYcQPVPo
	6ok/TK1/MsckRVsakw9rlI4r3ys+hUIsUfEvpWD2cfqCDOhmXQqq4xyUoS/KDSxRrYqBXXfuSd+
	r+NSwOAVswb3u8Xvvk2k34jk5Oh77px4waKlKkW5fiO47zGxrKqGhf0LTBcwlioo70ppm4+PgPR
	mvFUpxVaEasZo3mHCbD/RWWrI2qYWY4gPK/SoePhgBPkukHkPs8ji6PskGjg1jga5DsbWR06K3Y
	m5+Tr14d9R/1WCPkHS5dBR3ViSJh99uKvu9fnoQIeAte9zFdzq0yUZR+UXH/24Hxx7aHVIfcWu
X-Received: by 2002:a05:7022:1601:b0:11b:a892:80a5 with SMTP id a92af1059eb24-1276acfb85dmr356956c88.13.1771620567943;
        Fri, 20 Feb 2026 12:49:27 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ae99sm506894c88.10.2026.02.20.12.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 12:49:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4b24f1f4-b395-467a-81b7-1334a2d48845@roeck-us.net>
Date: Fri, 20 Feb 2026 12:49:25 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors
 when parsing properties
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, =?UTF-8?Q?Carsten_Spie=C3=9F?=
 <mail@carsten-spiess.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
 <aZcenabXYsOdBu84@smile.fi.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aZcenabXYsOdBu84@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,carsten-spiess.de,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28357-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E4B3016ABFE
X-Rspamd-Action: no action

On 2/19/26 06:30, Andy Shevchenko wrote:
> On Thu, Feb 19, 2026 at 03:21:29PM +0100, Geert Uytterhoeven wrote:
>> On Thu, 19 Feb 2026 at 15:06, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>>> Instead of checking for the specific error codes (that can be considered
>>> a layering violation to some extent) check for the property existence first
>>> and then either parse it, or apply a default value.
> 
>> IIRC, we have removed superfluous presence checks all over the tree
>> during the past few years? E.g. of_property_read_*() is documented to
>> return -EINVAL if a property does not exist.
> 
> Even though, it's still fragile. When we have a check for explicit device
> presence, we wouldn't care of the error code we get in case of unsuccessful
> parsing.
> 
>> So this patch looks like a step back to me...
> 
> Obviously I have a disagreement here, this is step forward to weaken
> the dependency on the certain error code in the cases when we can avoid
> that. Motivation is mentioned in the commit message.
> 
> Also note, -EINVAL can sneak in tons of mysterious ways as it's one of
> the most overloaded error code in the kernel, its semantic is basically
> equals to "an error happened".
> 
> Having the code above, we make it robust against some subtle nuances which
> may not be discovered in time.
> 

Is that documented somewhere ? I have been asking people to use the current
approach to reduce code size. device_property_present() isn't even mentioned
as API in Documentation/. If "do not rely on error codes from device property
API functions to determine if a default should be applied" or similar is a new
rule or guidance, it should be clearly documented somewhere.

Thanks,
Guenter


