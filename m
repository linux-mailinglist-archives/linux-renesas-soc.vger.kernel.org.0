Return-Path: <linux-renesas-soc+bounces-22339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3683B9AB3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 17:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CFA3162A84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5A630F95E;
	Wed, 24 Sep 2025 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="yzaJmM62"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE80021257E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758728002; cv=none; b=WQ40URWMXa79klPn2Xa/WS07lA/zk0tIHPxzoGp3dzaxc4Vb0A8PHB+EPQPR8hezd7GMas7JNd3G7Qhdv5/mw46QdFrsev9E+24oeo17CGXayH/yq4KjcDVBiBfL9ktPmZYAYRjsNw44jT5UglDwu4frTdy/j8IhCaqdRplafz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758728002; c=relaxed/simple;
	bh=oj40lHJe2CXGo61XnScdHEqFvpXJOdvbt9aC6Rr03U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jmBH5dYgMf2+l0iG6QDYbzxl7C/YI6Q2Egb1wyUClqmjs0+p+TZXN3zd4s9ghD5lcgz6t/pRGDQnUwvw7FBSA175bnUZoz2NKwF/zJL4MMCxGVe0NOuCRPu84+N56vTZtoQ3v9iZVjeAQV1tbAg45A4wiuEnOfWWyw3DXwBdfIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=yzaJmM62; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so6133362e87.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1758727999; x=1759332799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIkBf3qivogFIYB3w/+L+S2G/9aj30PqRjDjHIQrDuQ=;
        b=yzaJmM62jiv9QSyXTAJV8YMaZYJPsQJnaZ8EQSGY6iVJcTB1Y6jck+O/vzR4fvBo23
         Lmys3K/s8KmivHQSc3Rks5UVyvtvFjJucSNig5Yek3vT8q+AByNaweeRdseBYBX+rrM3
         tCU9dkng65n4FlD3hyKvWXtaJRtAvO28kHEDlmALkb9zKk/MaFrfa2BshSPywPI0aDfs
         LyuYVJ4wsIzEoHJ6OlRUL5xTTnsDXlNWVPWSkDV0xYBnATj1E3jSdV5DRXA9uZA0uK6c
         TnXZi9rw8GV02Lip0YajFcviymIFM4XwxKPwr/Vvt7jrCJeRzAwg3LDsB/6FdTHOWHa1
         iD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727999; x=1759332799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIkBf3qivogFIYB3w/+L+S2G/9aj30PqRjDjHIQrDuQ=;
        b=S4k9VVWQvjk6xJt2BWb9eZRgv1ToERcZ7SHGv0/nC+uM7wMxz2eilb8udEjs8n/VcX
         7fLUV5jSCnkrbaoT+k8v22FcMqOwGrGdmxR/xH9gM/ZBDOj4SVjpyZGVFKojCKFKVaZB
         7MevcFZPKPme9zbZDn4Zl/9h99Cv8/LLQyq6LpKEXQHP2+BOkZp/lWZW59JvirEFgFED
         kEO+stB6iFUVEZ4sltfcyFlstqHNsuoEYf+dle2D+JL9Ezey5DY83HEEgfzYtsZ0EMnS
         0xB9YByhbMMYj/m3xK0PQLLzGCqyjyBF3rZen1rQx97isG2b9Lmhs0HkC5ti0esaWLc+
         7X/g==
X-Forwarded-Encrypted: i=1; AJvYcCWGJEERc87ejiNBmV/yG7aMpcxMqLz3QcRARdBMJp+CNa7Y0BwGVA3OIQfOQTnT06uxHyjZOE6LeTtaOYe8+ObRcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHH9xgdGzGJiDEYY22GAfXuaai83rigsnxdaeoD+gacewgZ9BV
	HpZMOdKZkyVWyZVs2rNE46YneInWzHgkAL7tdDM3rRA0TEQb8uuJ8v3mvsUX8fhUut7LEluE6oZ
	CWGlPO/Wv3Aok
X-Gm-Gg: ASbGnctXitAT7mUnovQIjPi5wnZnvSp+sfys1WBUqv1WNqWDDASIkuYbmVIbk/QCF6B
	Py6mfXzHckhcsFRjFz/3P6vUsptOfkWvYXSclaIr9YptIW2FKgpEsU+kN3H7B+pyrF4xSoLpdux
	W4t2/quV6Tpmx9YeF1LDiuk93DjZrg8EPs+kHl15W2OL4sTE+6ejf3pqX2bdWRh8XHxlY/OffhT
	t5eXhrRQKdxcQeflJxp4Jm/toqmbqmEWW8TpTuJKIfZpHsbbtqtLNymVjzbXt7LTck8NjVOBLw7
	UpyPfzhhofZoszJomRNIPqWD99lUodm67TVX7OHsJHw0dRdqSmaD/xGAdqYYMW5kUwEsW6Nm/kJ
	firoKMrjxHGgKWG29QXambyC4cn5fXMOd8M8Jsai7nLpChZoz
X-Google-Smtp-Source: AGHT+IH1GOx/pgpEVam+Qq+Qt3KSl//uKOXGpLYUqrQ7YkBLxLp90yiM5cgLCS5fXN5hydSO30VRWA==
X-Received: by 2002:a05:6512:a91:b0:57d:a4e9:5b00 with SMTP id 2adb3069b0e04-58072cf64e0mr1912058e87.30.1758727998821;
        Wed, 24 Sep 2025 08:33:18 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::9a07? ([2a02:810a:b98:a000::9a07])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9f1419csm5120236e87.148.2025.09.24.08.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 08:33:18 -0700 (PDT)
Message-ID: <007fd561-70be-4960-9e74-06792be5818d@cogentembedded.com>
Date: Wed, 24 Sep 2025 17:33:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [net-next] net: renesas: rswitch: Remove unneeded
 semicolons
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michael Dege <michael.dege@renesas.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <e6b57123f319c03b3f078981cb452be49e86253b.1758719832.git.geert+renesas@glider.be>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <e6b57123f319c03b3f078981cb452be49e86253b.1758719832.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Semicolons after end of function braces are not needed, remove them.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

