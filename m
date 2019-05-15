Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC1521F833
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 18:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfEOQJm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 12:09:42 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40364 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfEOQJm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 12:09:42 -0400
Received: by mail-lf1-f68.google.com with SMTP id h13so254700lfc.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2019 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G6gVpku6HTmdux/4tz1klLiPEuMIod8NPcJXLdWTNAo=;
        b=srskuAzYzXTAQCRjcRe3wVHJVTqDCpFMlG3/8iw/YOIErW2edPKL7YpmsrOBOyvh2E
         XpiIHRmwaTRu0wzYQuGg8DqCBfBuid+4+tftxqT+CxY12A5R4iEr0hs06xneW+gEc1k8
         bUYrAGN9hHoOecWCq31nUn1uzbFQqQ1epQ18ejMWV8pNCi2YPo3HlYKo/DwWT5X0/06C
         TwG4g873ar5upL6fikUMFUHdshycJ62/FSVIKh2gMG1TMH89EowYNbMZL8RNz04Twxy1
         Ofx4DlUTe7k2QmSF5EiPYFBIrOOFal9HneKB5mRVWFOX0aBtu9Q0lkZS2fwrHVECJHcn
         SYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=G6gVpku6HTmdux/4tz1klLiPEuMIod8NPcJXLdWTNAo=;
        b=EWGLh3xCTvxSSSx2mbPOWlJ5Y+nyidYeCP26DcXAMhYMovKb2UQVENo7zI4EYcaInk
         znA3Evnfs4XmWZ+VjAWea/T04ophc3c1LDCNbhpnrAYvgM8U1DkXBrkrNEF0mYkR1JQP
         f5WE+1EGFU7yuaj3Hamq1E9ZmeRW2t7P8LpYjE+IVrrNABEdYclDcT1kh08/V3jtgtJO
         QWazz3vv3CbSIXuhVpyaqmyILXWKjgjHS14fBeNQMt3FRybIZaaEc0fqEQgIdK7aUmkJ
         nFkuchwA/NROhhmft1oRqhjdNyaYF24AIp+38xKGlDNUFG3TSiK8uiVLP1Hb3JFBRe9H
         MyNQ==
X-Gm-Message-State: APjAAAX+BwoT1n91sp/doaU5R6gXME+MtWL7B9j2F4Q9V5MQDb/nzWc+
        8ZqV4bwM0ib6UAIu4ZincmA0MzR9AtQ=
X-Google-Smtp-Source: APXvYqwhMmsX0NYKF8RCfm0n9MMzjHUjVtSjSPo58Wha0g+uEai7D6FuS82WLoK4GBwMloOLtxwe9A==
X-Received: by 2002:ac2:43af:: with SMTP id t15mr11807306lfl.45.1557936580687;
        Wed, 15 May 2019 09:09:40 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.86.124])
        by smtp.gmail.com with ESMTPSA id t23sm519589lfk.9.2019.05.15.09.09.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 09:09:39 -0700 (PDT)
Subject: Re: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
To:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c9b3ee90-9292-320c-4e22-8f989d829497@cogentembedded.com>
Date:   Wed, 15 May 2019 19:09:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 05/15/2019 03:09 PM, Biju Das wrote:

> Add device tree binding document for TI HD3SS3220 Type-C DRP port
> controller driver.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> V5-->V6
>   * No change.
> V4-->V5
>   * No Change.
> V3-->V4
>   * No Change.
> V2-->V3
>   * Added Rob's Reviewed by tag.
> V1-->V2
>   * Added connector node.
>   * updated the example with connector node.
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> new file mode 100644
> index 0000000..7f41400
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> @@ -0,0 +1,37 @@
> +TI HD3SS3220 TypeC DRP Port Controller.
> +
> +Required properties:
> + - compatible: Must be "ti,hd3ss3220".
> + - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> + - interrupts: <a b> where a is the interrupt number and b represents an
> +   encoding of the sense and level information for the interrupt.

   This depends on an interrupt controller used. I'd just said "an interrupt
specifier", w/o further details.

> +
> +Required sub-node:
> + - connector : The "usb-c-connector" attached to the hd3ss3220 chip. The
> +   bindings of the connector node are specified in:
> +
> +	Documentation/devicetree/bindings/connector/usb-connector.txt
> +
[...]

MBR, Sergei
