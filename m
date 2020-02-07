Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3F35155AE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2020 16:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgBGPk6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Feb 2020 10:40:58 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45293 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgBGPk5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Feb 2020 10:40:57 -0500
Received: by mail-lj1-f194.google.com with SMTP id f25so2592069ljg.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Feb 2020 07:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zodWAZyG/pK9qVdLSgvlFZJuy+ulyQUY3o4wIX0GDJY=;
        b=r8+ulXsD8NtbafPYE8tlsrIRtpkvpUThqi5ViIovDLcmCAf7UmIXqCBDSziW2K7PFt
         +wd7cr7g+4Lz6bYhQwGnY8ZZIp+Gul6YNLc4nxnvjiJCWdxARgd4Wi9OlGrh8CyD5Rws
         aD6NJTM+s97U1who2k4UDboJ4jcb4WBC4MI8X6sUnxjib+Vc3yOdi2pDm3f0w6jY0QQX
         9WLEd3xnk8BnZXanTR1e/UDYG6ucpxgOYwFbJkDdzvOqrn6EfCcXFXqwBKExUewYCjVM
         rJoPMBYr35c3Knv9agDBIK/m8b1jmR7FWxMXxSA68+5fxMdOBmIhfD1Kdx9cKTCFTbHa
         waWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zodWAZyG/pK9qVdLSgvlFZJuy+ulyQUY3o4wIX0GDJY=;
        b=U9pBYQoLJXOQEBZHraJTDwwgdq/nQmv9ZKDabYzMlg2Aw05GXp3ILF48IbRmme3d/N
         S0dt91vylAx90zsVr2RlCjzZbQCXMvt20Xqis9rQRu/0vMbByBIZy8DZS3EHd9l4SOh5
         BkI0OlOc8BRU5cyj9w+WexyQiHXO+oeGv5O+JT0W+OlpbEuOAz+wTkWKWVe4JnWzn4Sh
         lsOVT+jOleAktixdA4uowGt749anvKBKHKj4WrEwF6d73S6lpxWDH6NQUeFZoSHak49v
         9WecO0ZYyltaCPkQWAaHLW5T6cL/ETs/phJST45ANWsmzjoAFY8y3c0J3MNU4hGtMMT5
         MYOw==
X-Gm-Message-State: APjAAAU4LfCEsBtkmStw3cfeVS1Za7znJplxuasnGo9cu9D8esdN9nln
        DYCV2tXzmOQ2GFnvP7S3iIm4KhgKSqg=
X-Google-Smtp-Source: APXvYqwM7S8r4zrg0wzLTjWvWSkB3ruYcbB+eeCLGmvzViPAwdvavkjuEWscHpbQBYPxlD12UIwm9w==
X-Received: by 2002:a2e:7e11:: with SMTP id z17mr5790490ljc.279.1581090053202;
        Fri, 07 Feb 2020 07:40:53 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:667:86ec:de03:9020:cf24:beb2])
        by smtp.gmail.com with ESMTPSA id q10sm1444816ljj.60.2020.02.07.07.40.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Feb 2020 07:40:52 -0800 (PST)
Subject: Re: [PATCH RFT 0/5] sh_eth: get rid of the dedicated regiseter
 mapping for RZ/A1 (R7S72100)
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
 <TY1PR01MB1562CFDEE9179DC7578A99CD8A1C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <89d58b6b-df39-0048-b391-49c68012dc56@cogentembedded.com>
Date:   Fri, 7 Feb 2020 18:40:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1562CFDEE9179DC7578A99CD8A1C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/07/2020 06:25 PM, Chris Brandt wrote:

>> so far: in the ethtool API for the register dump. I'd appreciate
>> if Chris Brandt could sanity-test this patch set as he seem to
>> still have the RZ/A1 hardware...

> Works on a Renesas RZ/A1H RSK board.

   Thank you!
   Would you mind providing a formal Tested-by: tag? 

MBR, Sergei
