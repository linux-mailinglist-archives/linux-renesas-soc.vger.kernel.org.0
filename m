Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00BC481588
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 18:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237503AbhL2REW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 12:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236385AbhL2REW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 12:04:22 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A75C06173E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Dec 2021 09:04:22 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id g13so24521041ljj.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Dec 2021 09:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fTrzUJWfhUIkdckLSHMnURIWay1hQkAnOl+6SgL3Qxw=;
        b=iL/eGYu1HjMm8BVvLrWVPKGJwWFEI9BJY8jfbW9O4spm7Y+Rb/nqCE818TUR22pidR
         BTR1QIRah9M8TayWD+Zza7+7pWMSikKh/UxZFvJ8uTqLYCLG7sG2obWMSjN4lzN4KSDq
         JMj4yi+WDUakiXsQfNOA2tjQDQvFGwqUL5N+IvGS+FXtxvM061MQwqPDKLdLtE3mKIGq
         rglor7Q/lh6D9GPYcYyaY6l0JUF869EmDEX4rtGmMbBhCCX/hgNFO/OnZV1Hf4QZeED1
         VApBUUYZ0ZiMXzAGIn1cz8mIO29J6fEWmAGW9jkaRCaqdriZLZCdqt4mUvmLNwo6Zt1W
         qd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fTrzUJWfhUIkdckLSHMnURIWay1hQkAnOl+6SgL3Qxw=;
        b=eiMSlA+BkB6xGzgXRN4Gf0Sb6TzTsPlDkOiB7JkqKBsO9KY8QVo1Z5ZLk/ScCXKMmo
         6EVYShmJFtpL1iVQ8MYXakGvfAn4VCVVprzr4Qu9fZAC/9oDca16ojN3Fl8Wz/DqZE2H
         L+/8D3UDlQflXxNHzoP9Y5UFQvtyBmSCJr99vALfCZm1WkgXEZDP3O1zWg8SHPheXkMT
         gejUxYfJKLt5kP+lbwJK1cK4TVqy8cprIE1GrlJRUmjwOcE/w4oaLFGG1cF+FVvGhisT
         TJdyrqQJJObHdziF9FSRv2CPh/6KBRy8QASeDDUB25qmVEZt806ZAaATycc05y0qj2hF
         ARPQ==
X-Gm-Message-State: AOAM533ImrDEILBeUbrMbfhGgL4TnY/05BUA/gxmisV9GXEIhXDpDyWz
        3q1EVHWr4gOKDO1slRcEeU42sw==
X-Google-Smtp-Source: ABdhPJy9XbWrnBPDstakJxVDB050NScEATy/Wshvr7LpHN1RnyZTAAmnTgZ+Ok5FsU0wgvur/5ydjw==
X-Received: by 2002:a2e:9cc4:: with SMTP id g4mr20600989ljj.164.1640797459871;
        Wed, 29 Dec 2021 09:04:19 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id b26sm2120463lfo.6.2021.12.29.09.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 09:04:19 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <87626d61-ada0-c220-bea5-5330f5256629@cogentembedded.com>
Date:   Wed, 29 Dec 2021 20:04:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi.

Thank you for looking at this.

>> +				port@1 {
>> +					reg = <1>;
>> +					lvds0_out: endpoint {
>>   					};
> 
> Endpoints must have a remote-endpoint property. Let's drop the endpoint
> here and keep the port only, the endpoint can be declared in board
> files.
> 
> If you're fine with this change I can make it when applying the patch.

This empty endpoint is currently defined in dtsi files for other r-car gen3 SoCs.  Goal here is to 
define lvds0_out label that is then used in extension board dtsi files to link to the port.

In this patch I just used the same approach as in files laying nearby.

If this approach is not appropriate, then perhaps need to fix it in files for all SoCs, to make it 
possible for extension board dtsi to be compatible with all of them.

Nikita
