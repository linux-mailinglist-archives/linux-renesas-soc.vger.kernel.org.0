Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59162D5B6C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 14:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732028AbgLJNPz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 08:15:55 -0500
Received: from mail.iot.bzh ([51.75.236.24]:10647 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728462AbgLJNPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 08:15:55 -0500
X-Greylist: delayed 461 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Dec 2020 08:15:54 EST
Received: from [192.168.1.26] (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
        by mail.iot.bzh (Postfix) with ESMTPSA id E907940098
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 14:07:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1607605638; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=+xLiN/dLpZsFuk28BSbcl2EEGcyZ0pfxMJhvLUOGsh0=;
        b=CTOt1KsAJ9qZbOO4Z7PvvqQN/2yRoBxzasNs+CpVRtuVUQ3PKi8obIglY9DZS15qHniyFe
        6sYi1+DlHkgwCG4jipuwCgf/I+ygKqq/D0PyJAU06N6LtIIziK8eE6wzNt9PQRjSTp2T8/
        zcwllqP/OdXssMLm+sSpYYQqdtmUZM4nafnpr1iDkY3qHrmZbMYGtAu+VZQmjei3jWcChs
        k6Ib9964SkxYzkI4Td6MaBGtle48YMIKAdMIV/Qr9YdAM6yGphoUK4SJ6aKXIgw3j1V6wy
        g+qsEPeBF3D/OfYeHhgJHdYqeXVEVXwqqfTE9LF6RkURCxULneew8vw6zNLugQ==
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From:   Julien Massot <julien.massot@iot.bzh>
Subject: Parent clock for MFIS module
Message-ID: <c84c0d96-b768-600a-e412-f25d5ae299e5@iot.bzh>
Date:   Thu, 10 Dec 2020 14:07:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,
I did a linux driver which makes use of the MFIS module, and so my first 
step would be to send a patch to add the MFIS module clock, which will 
basically do that:

--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -137,6 +137,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] 
__initdata = {
  	DEF_MOD("msiof2",		 209,	R8A7795_CLK_MSO),
  	DEF_MOD("msiof1",		 210,	R8A7795_CLK_MSO),
  	DEF_MOD("msiof0",		 211,	R8A7795_CLK_MSO),
+	DEF_MOD("mfis",		         213,	R8A7795_CLK_MSO),
  	DEF_MOD("sys-dmac2",		 217,	R8A7795_CLK_S3D1),

But the third parameter of DEF_MOD is definitely wrong and despite 
having read the hardware manual I can't figure out where this 
information is. Does someone have any hint on where to find the parent 
clock for the mfis mod clock ?

Thanks,
Julien
