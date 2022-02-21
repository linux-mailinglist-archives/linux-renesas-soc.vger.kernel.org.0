Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 653364BDF36
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381298AbiBUQyN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 11:54:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236640AbiBUQyK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 11:54:10 -0500
X-Greylist: delayed 179 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 21 Feb 2022 08:53:45 PST
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:400:100::a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB69C22534
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 08:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1645462242;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=K5C8Dhu+YNf1WOD2amlcnu/3tmStkuqsr65XbgfBlY4=;
    b=DidxxpUnW3NJcYxsqUoWS0Hkscz9OdBaAEMDSjrEOTvp6KPeoN+Olp64gHRak/G0U3
    KN0H7PF62fkeYZ+Nt52GfaR0LfGJYyC1xNvYynjNiQ+6CE/frDiCEECTJ8dqRQ0m/O/g
    YfRjQ7F/tNZnQIyYodk2KDAHlj9/assFTNdpWboff3aYD5RJdWYm1yzeQDNmR3lJkxy9
    jKp6x6lPXF1WeTwsfgQKh4/MNA34VRarbKw7uyu737u+odLuS2eUtJ7XTbd58TqkDn8/
    uPYJi1lsDIBvrh2wBiW0DDYP33hiZP8kBP1FbNT/efnTeq9wLKWvej9TyHWhiZj3l7Ss
    j1mA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/xi15g=="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-05.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.40.0 AUTH)
    with ESMTPSA id 6c30c7y1LGog0LT
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 21 Feb 2022 17:50:42 +0100 (CET)
Date:   Mon, 21 Feb 2022 17:50:42 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <312332855.472251.1645462242686@webmail.strato.com>
In-Reply-To: <118d62e167f6cf5e98bdf9a738634b4590ea8d09.1645460901.git.geert+renesas@glider.be>
References: <118d62e167f6cf5e98bdf9a738634b4590ea8d09.1645460901.git.geert+renesas@glider.be>
Subject: Re: [PATCH] serial: sh-sci: Simplify multiplication/shift logic
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.5-Rev38
X-Originating-Client: open-xchange-appsuite
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 02/21/2022 5:29 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
>  
> "a * (1 << b)" == "a << b".
> 
> No change in generated code.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/sh-sci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 968967d722d494c2..77d76973858f7d7f 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2293,7 +2293,7 @@ static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
>  	for_each_sr(sr, s) {
>  		for (c = 0; c <= 3; c++) {
>  			/* integerized formulas from HSCIF documentation */
> -			prediv = sr * (1 << (2 * c + 1));
> +			prediv = sr << (2 * c + 1);
>  
>  			/*
>  			 * We need to calculate:
> -- 
> 2.25.1

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
