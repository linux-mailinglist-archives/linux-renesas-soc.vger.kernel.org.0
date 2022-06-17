Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A464554EE64
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 02:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379219AbiFQAV1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jun 2022 20:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379238AbiFQAVV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jun 2022 20:21:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EF263387;
        Thu, 16 Jun 2022 17:21:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8631A61890;
        Fri, 17 Jun 2022 00:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98CDC34114;
        Fri, 17 Jun 2022 00:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655425279;
        bh=0YG9KQ5Z4Bh5yDSmb2sDcJxLFIow2viN8+dEV7RWx24=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=flUbtn/1uzyKtxubb4PflNkrpEykg69rrNaRe86hJ2fhDcL2EfPfu9M1wQMUaWtKu
         sFOyn9i9VZpxfk7j9PJ2wb/Smn6Ko7LmBMMiibJdK+DP9KXQuC5uwwiRu+noEWOtwX
         ZhZrGntAJZk7r53NsFzM9p9S5MffvcCbYYRuNpmftfuIflCRiwk9qPTRDSF1Eu5pH0
         payX84cDEYXxOsRkuqJ7xUVnJoTX5SQWPKNY5jUeGnhx/hIFyNfgvBtvGUmQRll94W
         C1k4xMj1GhgLlCpZ+/mdzpGreTheDaNduSK1Kj22A5plmsi+EHyOCgcLkLKYYHG/Ec
         wwx7PjfsWiISw==
Date:   Thu, 16 Jun 2022 17:21:19 -0700
From:   Vinod Koul <vkoul@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: renesas: usb3-phy: Spelling
 s/funcional/functional/
Message-ID: <YqvI/49t7nNqpKuS@matsya>
References: <3da9bd360e1c83007af0e0e90fa4e6c2b50fdab3.1652100633.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3da9bd360e1c83007af0e0e90fa4e6c2b50fdab3.1652100633.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09-05-22, 14:53, Geert Uytterhoeven wrote:
> Fix a misspelling of the word "functional".

Applied, thanks

-- 
~Vinod
