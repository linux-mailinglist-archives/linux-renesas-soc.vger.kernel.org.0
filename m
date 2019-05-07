Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7C9F165A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 16:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfEGO2a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 10:28:30 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41449 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbfEGO2a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 10:28:30 -0400
Received: by mail-lj1-f195.google.com with SMTP id k8so14519819lja.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 May 2019 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EedFfExEAPHM+PZr6GR11mpG+D5zRor5kGwA4BVlfyY=;
        b=uf+CmDK2YI6m644TB+xuy6UsPlkwrb+ZxcN4czm3KYEALhBCKTcLpg9aF3iTBitvvo
         KjNtWx3/I5gEVcMv0rgFmiB7FYtFV0UpoNntXVYY21xu+U7JHLFc2VuoYnrAtbnW2J+g
         rdpY4n1XVGQ2nZX4SDrXpOLbYDEabk13f5+kCLQw9IXPmHCApwZ7X905CrNJAEnsmbRt
         V+y60q9tlTxyr/yrTE0Ozjiqf8myMTEbQ/jehp4tMlkUu8M7qRRIp4RiDOFuOoN/3Dek
         anD0kRP2TMU2L4pW4z4noSxNErlaZxVevHpjiWtNfqVN0GJzKk+alg8SCLhUZLVIDWXM
         wzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EedFfExEAPHM+PZr6GR11mpG+D5zRor5kGwA4BVlfyY=;
        b=E3FThFULFOSzH9CE8UG4hTIR+iRsJ88RsjrPNqkg9DGZxpC2J4L1SegA2Jic4T5Ii2
         QqJOICjt/nMfog5XquCE8Qy50wmNqjtMdHsClaEjtMElQkL0LmG9Vj2DfXS/ixUkyqzV
         6LBiY1LO/xDSd3AM5BN4gQmJUz05CXlFjtiDLS3eA6GJ+pJf3TY6TBwf8JLcwYX5Vr5s
         WhYqx4+/jLvsZ3yJEzS6j3gOLn+hTHhRTawNYdqEV5INHM/rkzSNfvwsumbMJQKbdxxr
         e0pKJvpUYYEYYB3LN8i7ndvj34fcUpAAarmZkJllL8liDrMezzS+FzS7yd0mYtC7tzSz
         eRKw==
X-Gm-Message-State: APjAAAWfXF97+awRP/WuusFnMdEdu7FVIPopwECQl/UjQmdJLsPAprwM
        sRxXxqe4hpW8wfPu4qVOGA0dEt5xusk=
X-Google-Smtp-Source: APXvYqw0mASzMSi5rdO7Sb18cOgjD5LYFYcr/D6t9bnbMaeljY+qkhroQl+x8E1AOmi4OEMvYCIjsg==
X-Received: by 2002:a2e:8347:: with SMTP id l7mr17756852ljh.17.1557239307989;
        Tue, 07 May 2019 07:28:27 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.83.143])
        by smtp.gmail.com with ESMTPSA id j24sm3154312lfh.28.2019.05.07.07.28.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 07:28:26 -0700 (PDT)
Subject: Re: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
 <17bcc673-5fed-ce4f-3d61-af34bfa5d769@cogentembedded.com>
 <TY1PR01MB1562550164C7977D28C90F128A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <34544f59-76aa-710a-a6ec-7d7d7f31a023@cogentembedded.com>
Date:   Tue, 7 May 2019 17:28:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1562550164C7977D28C90F128A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/07/2019 02:45 PM, Chris Brandt wrote:

>>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> @@ -408,7 +408,12 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>>>  		if (rcar_gen3_needs_init_otg(channel))
>>>  			rcar_gen3_init_otg(channel);
>>>  		rphy->otg_initialized = true;
>>> -	}
>>> +	} else
>>
>>    Wait, don't we neeed {} here?
>>
>>> +		/* Not OTG, so dr_mode should be set in PHY node */
>>> +		if (usb_get_dr_mode(channel->dev) == USB_DR_MODE_PERIPHERAL)
>>> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);
>>> +		else
>>> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
> 
> Technically there is only 1 statement after the else (the 'if' which 
> will also include the 'else') statement. The coding rules say not to use
> { } if there is only 1 statement.

   Don't you remember another rule: use {} in all branches if at least 
one branch uses {}?

> Chris

MBR, Sergei


