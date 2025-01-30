Return-Path: <linux-renesas-soc+bounces-12754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A3FA230B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 15:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA0401888555
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 14:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780E81E8823;
	Thu, 30 Jan 2025 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2j7Tkru"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC91E376C;
	Thu, 30 Jan 2025 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738249014; cv=none; b=hKEziw8+Lr8KCjiRqxBSLU0c/meoccJ22dvDvZJRxroJisdpR0VIyPFf3HgF8hWF3lOVAk7fhP8Vh8MAwxrAmQM6FLA9aDFZype4DKpJ0IziR/BxY+sJNkvSG+Kgyi9mWOwQvall0udYzGAvcyWn6VPDs0UDJkGqCr2Rj3oyTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738249014; c=relaxed/simple;
	bh=3cbWHV5V0moJNGFifrX+6pss6MgxOlQsPjVM6UK8PPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTVQmN1ECCzX3SYP+jiynzGbD5+uxa3+t8SFjDTA6r5xWo/HbrZckFuXNGWRR8Zu1BJe6px9NKW0lR/VFBhiiU8DPy9Fu2JySM4XE+8ehnTsxgCut+4cRWo43nEv5YDkiygDEU3JG8f22ecuHfTIMmaZ871vn8S7OKP+QGhX51E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2j7Tkru; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216634dd574so10894055ad.2;
        Thu, 30 Jan 2025 06:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738249011; x=1738853811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZCtqK0aiuOEM0ZR6LwU+cZ/tHWqmthI7MbKTUCAetk=;
        b=V2j7TkrurgGfgE5+UCogAGbj6UKgzywnutwRCtoEno2okw0G9gmOzyXKSa56PzT6wL
         we0PWq6Q+//AdhHxfRAkV7at/sSb9onb1NiI+JKEeU4Yz3dk+np8OcfVSTLHwstrbabz
         byShi3cairg9M0F9wHbyqb0Yx/GVwVlMqxW6TcnTByXpB+UGFvQXv/N8+eFT5MHT36Rs
         AeDJYD9DTW2AMUxorkWaZnfsYpl1erqlK92vF9LWjr7v5etsm4FbSsX7CyGdZKY/8M5p
         dNcv1no1ilxopeTuvZwR2pz59OYd7fv4qhBp3NKe4IdCqOQVU49dN3dZiFESaMKpCodY
         kVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738249011; x=1738853811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZCtqK0aiuOEM0ZR6LwU+cZ/tHWqmthI7MbKTUCAetk=;
        b=KFGvQNFvS+1bC7hmFHOolRD353jqimTGfEbHf2Q4R6ATGIQMWhan+ktSfs9OUp1WK4
         I7R9xHjc/sbwKFDvCMtaYLsWjZm1TVYJ77d79uV1xQoRBOllh5eCJjsiRLc1ekVTsvdE
         kU8FPvPuJHxIMcIxJAHUBmTHTs1/xb6v8PCQIqF/MtDitv8iaV3XF3uAyBCl7xna8lyw
         +xJ5zAjrB4tedjViWfzEIFKgZTc4PfH7L6d7Njj2LL9fF4ljgbC6Pcy1xiFulcI5JsYD
         TTOmUHeBuF3pBsibNgg+CTom3abogeQehCzMCUXOOJDcWwEpWWd22WuiWBuaPColpwQV
         b1uw==
X-Forwarded-Encrypted: i=1; AJvYcCVVny+uymmnit+FOfAUdsV9UnDYJ2rr9yN4DY2MR8/MKNErFvgiceVq4sLcv+NQbO6aIdAaNf3LVsoG4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP2kU8FBxj6Ii0dE6M1vUXQoHjJXX0MLeWBsGbElzkWcMpQ3Uf
	TUV2RxfDGjIjuH8M6hPGJwRZxJfMNe3nZhbo4Us9hRPqJ0XWTOsi
X-Gm-Gg: ASbGncu2gbJ92bTtwAJaAa2cMsy7U82+QEII4VoKi9gHET1GdyD3TxokwwgGDLsCEX6
	pvTaPUabiQO7QhLs3RZfrf+cN0YY9z5P2v062puTHFD7xxJaKhJUjq5wVCXSy7iCRdVFl8v+eJc
	symM8h5lmEMRyHtY4AWRPWLRRqzXm/aSSVv9QsecZ2kYZbDF6O624BvJSaln+4YLgIuPell6gKs
	y1fVEF+DcgW5yGlrn9JKoJ8O18/R0wloWAtDprcbzFj1f3rG35QNvsl6oydVYS25zk1vxp4PgPj
	5fo1Z75Ik9FCZbGtuRbpVe2KlV9l
X-Google-Smtp-Source: AGHT+IHywSBIqDjP6a3LBAFUJgn+3V9j1byL5GAjmgO93x90n4NsXOXKWOhAQwtYCZc2VngyD78A9A==
X-Received: by 2002:a05:6a21:670d:b0:1e1:ca91:b0e3 with SMTP id adf61e73a8af0-1ed7a610993mr13478700637.36.1738249011570;
        Thu, 30 Jan 2025 06:56:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0479887sm1439523a12.52.2025.01.30.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:56:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Jan 2025 06:56:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFT 1/6] hwmon: (ina3221) Use per-client debugfs entry
Message-ID: <fee1311d-9b37-4fc5-bb66-c18e53b72da7@roeck-us.net>
References: <20250125123941.36729-8-wsa+renesas@sang-engineering.com>
 <20250125123941.36729-9-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125123941.36729-9-wsa+renesas@sang-engineering.com>

On Sat, Jan 25, 2025 at 01:39:41PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

I expect that 'i2c: Fix core-managed per-client debugfs handling' will
be applied in the mainline kernel by the end of the commit window. If
not, I'll drop this patch and re-apply it after the problem in the
upstream kernel has been fixed.

The same applies to the other patches of the series, so I won't repeat
that again.

Thanks,
Guenter

