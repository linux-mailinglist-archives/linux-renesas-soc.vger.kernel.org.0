Return-Path: <linux-renesas-soc+bounces-11861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A523A01AB3
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jan 2025 17:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC643A31A0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jan 2025 16:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C79B14D717;
	Sun,  5 Jan 2025 16:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPWckYMl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E351414A4CC
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Jan 2025 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736096014; cv=none; b=aFQ0sdV9eJMrpHRzz3YQ1PLRfAR6XB2XEOU2RyeWZkABiMnssQ4BrF1PCGhxuhGmo9NS18p6suk09FUUgyRfr4W/1ymfidof1M3MibnjPTR0rp0Jw4vZofmDSGfn6PK1VUfjMtca70sxgH05twlzuIHoK9Lg/TUQYvsy5Q5JROQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736096014; c=relaxed/simple;
	bh=dm2CVgOeUMxnPwXmGBh9jXrkwI8tzVSGMW+uPQsvvqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Or5GAyEIXF5mSHCONIiRkv+w95sEDD5IWlUIeafM9vQ11RPq8DBJitS1bkX4pJlgnqmhbhapdnpkzR6Q1qmS+Xh6IUwsI3Es9MSuwRaxLs/pmB7/R0FzqbDuH8iw0RtaYg9d+g3DOv9jx3JNPcc51qIeFx7NeoEUnD5i3UmZDe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPWckYMl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2164b662090so169508005ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Jan 2025 08:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736096012; x=1736700812; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVkkUKi3TEoqcrBW9O+G+7DHI8k94lZ9o3ZtGWTmR/4=;
        b=mPWckYMltnQaOuwzmgoZgs8qf62FTGOFFR+u+PQDIxtCPx1wOi/O1xV8y4pjWFDHbM
         yQ7lcdIxSjUySuxlrIn4i0z6t5iax9/Tup//uu4pv1PcvWoKQOIHY7ENveahYvdBkrvL
         L8kW5Bb56zLDrMkojIAKe78oK8WE8iPu0w1uyw2nsN8A+3YTzmOKH/1LyaFOysltBwGX
         VD4Bnblw2aKiGLJz7tMSrD4s2i8a9OBTgiRLqJjHTwYLZLlhvEK2yJzeoV6nNXU2o6mG
         U1VqwiAuJSr+WMIbusVJGp2jzRSWvc3ITCHL0gvDGytc+mySaUecMKMW2H4dYOUJXDfM
         +JBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736096012; x=1736700812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVkkUKi3TEoqcrBW9O+G+7DHI8k94lZ9o3ZtGWTmR/4=;
        b=uM/NAoAhOlio9UJAH8Bub3aTZiEXN/d7bzX+WxizHzWfjiRS+3M2axKzc6wmDKB8xu
         qBOVlV9byNtPWVIAnK62vg966zn1roJVUBACNl7/HB76xieR3CqkgJLz2zmrWc1qZEjp
         vd8IocI92wpUxL+vI7dh1iZ3r1qErwMJyL2ohdIaddB5XKvChZvz2SxZp+TTBJyu+K3u
         FQvF0cgCGc1QnpDdlXHqjvV7Td/wZSGciNUn9OA3vZKtjfVq+NLDKoy3fMpeS7Bk5l+z
         S7Gv9WhS9jXdLozlllfXA+Lwm07/8y9ymiehlIKU+cX0ow8nVbKlCYIkl6qoYE6xG1TK
         fuvg==
X-Forwarded-Encrypted: i=1; AJvYcCX7scoctmuPD3hjBRbjjDGdNqc078wp6fcOM2YmiASXV4S1PTI3cQoDlmSkxwmymbBsyvCtEKuvKGhYoishmFaEmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywsAoO9b0U0DJcJ5dJKddmEXFX/DKU0b1Wv82bqhWSPCD2/cLf
	svvrsmXtHqbTbTYWqYTcm9B2th1jOQEBAxBfnvOOLNWosDIbYDwcI3f4+x/EYw==
X-Gm-Gg: ASbGncscMaCJGQxDDYvkuDdfeWQQgIME6tN6QXBQzyBlUWO4PgzVaFLeujdw8y9BTvV
	EjvXcLUh0oB8ZgrwR+P+tJjyRyowt9lxmyA7d/EXe66AWiE5A0qobvSWgBpaaQSlPptgAX+Zuty
	t9cku3z5zZhrvxvK39DLTS/1eY3T4GHZ/BLWThdmcy1SPk4TlFJV76fl/nL7JVn320bm9y8ahDa
	PMuB9oEtyKGliTGwqpJiJ7E5EfsnfbBYU1+CyI/E2lOyaMa8rb4+n4uZNGAgZn9E7YVzQ==
X-Google-Smtp-Source: AGHT+IGXvIwm3XR62M68f0UJnGgdNvu8I3ovTYOD52PhzIp4domidCXZMxXz5eNuZ3JRWmxru94gqA==
X-Received: by 2002:a17:902:f681:b0:216:7ee9:2227 with SMTP id d9443c01a7336-219e6f11630mr820530235ad.36.1736096012108;
        Sun, 05 Jan 2025 08:53:32 -0800 (PST)
Received: from thinkpad ([117.193.213.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962dc0sm278473755ad.32.2025.01.05.08.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:53:31 -0800 (PST)
Date: Sun, 5 Jan 2025 22:23:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kingdix10@qq.com
Cc: s.shtylyov@omp.ru, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rcar-ep: Fix the issue of the name parameter
 when calling devm_request_mem_region
Message-ID: <20250105165324.swmtt4qedut5eald@thinkpad>
References: <5f8d43fe-25e3-450d-b5c2-2d69b9bc9923@omp.ru>
 <tencent_6F826F87DF787845466AE67AEFF37E073E08@qq.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_6F826F87DF787845466AE67AEFF37E073E08@qq.com>

On Sun, Jan 05, 2025 at 01:57:51PM +0800, kingdix10@qq.com wrote:
> From: King Dix <kingdix10@qq.com>
> 
> When using devm_request_mem_region to request a resource, if the passed
> variable is a stack string variable, it will lead to an oops issue when
> eecuting the command cat /proc/iomem.
> 

Is this your observation or you saw the oops? If the latter, please include
the relevant log snippet for reference.

> Fix this by replacing outbound_name with the name of the previously
> requested resource.
> 
> Signed-off-by: King Dix <kingdix10@qq.com>

Also, please do not send next version as a reply to the previous one.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v2:
>   - Fix the code indentation issue.
> ---
>  drivers/pci/controller/pcie-rcar-ep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
> index 047e2cef5afc..c5e0d025bc43 100644
> --- a/drivers/pci/controller/pcie-rcar-ep.c
> +++ b/drivers/pci/controller/pcie-rcar-ep.c
> @@ -107,7 +107,7 @@ static int rcar_pcie_parse_outbound_ranges(struct rcar_pcie_endpoint *ep,
>  		}
>  		if (!devm_request_mem_region(&pdev->dev, res->start,
>  					     resource_size(res),
> -					     outbound_name)) {
> +					     res->name)) {
>  			dev_err(pcie->dev, "Cannot request memory region %s.\n",
>  				outbound_name);
>  			return -EIO;
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

