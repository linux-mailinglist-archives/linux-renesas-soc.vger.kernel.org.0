Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2026E23D7A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 09:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728652AbgHFHrn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Aug 2020 03:47:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50124 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgHFHqt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 03:46:49 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0767kjuA108199;
        Thu, 6 Aug 2020 02:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596700005;
        bh=SvkCKijJy/g7HLeElWMwyD3iJLiUjBLlIFhEX3ITMkI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=UBqf7nvc2aEs/7F/61kTS46RC950EPT1n+BzYONOUZCM4kHRzu4jJgkhOfwIsmovi
         p2Z4OhzN/sRKIjmM15ShTc82qnpFVCiIRqVcq4x6mDIIbfFOT5bGz4N5WivmtLX4l8
         f7e1eE9nhgxN5g9cy6fQ/t+dnguEkOPoDN7GYpgY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0767kjJf057498
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 02:46:45 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 02:46:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 02:46:44 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767khIN048364;
        Thu, 6 Aug 2020 02:46:44 -0500
Subject: Re: [PATCH 1/8] card: Add a method to retrieve the device minor
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
 <20200806021807.21863-2-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0cf559a3-881b-9190-a108-35a298954b24@ti.com>
Date:   Thu, 6 Aug 2020 10:46:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806021807.21863-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06/08/2020 05:17, Laurent Pinchart wrote:
> The device minor number is needed to access the debugfs directory
> corresponding to the device. Make it available to users through a
> get_minor() method on the Card object.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  kms++/inc/kms++/card.h |  3 +++
>  kms++/src/card.cpp     | 11 +++++++++++
>  py/pykms/pykmsbase.cpp |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
> index 5c1cf7cfcedc..0a11747f7985 100644
> --- a/kms++/inc/kms++/card.h
> +++ b/kms++/inc/kms++/card.h
> @@ -35,6 +35,7 @@ public:
>  	Card& operator=(const Card& other) = delete;
>  
>  	int fd() const { return m_fd; }
> +	unsigned int dev_minor() const { return m_minor; }
>  
>  	void drop_master();
>  
> @@ -84,7 +85,9 @@ private:
>  	std::vector<Framebuffer*> m_framebuffers;
>  
>  	int m_fd;
> +	unsigned int m_minor;
>  	bool m_is_master;
> +	std::string m_device;

This looks like an extra change.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
