Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0BC0765C76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 21:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjG0TwC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 15:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjG0TwB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 15:52:01 -0400
Received: from wp534.webpack.hosteurope.de (wp534.webpack.hosteurope.de [80.237.130.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661B22D45
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 12:52:00 -0700 (PDT)
Received: from [2001:a61:6209:7f40:c80a:ff:fe00:4098] (helo=cs-office3.lan.local); authenticated
        by wp534.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1qP71i-00027Z-TD; Thu, 27 Jul 2023 21:51:58 +0200
Date:   Thu, 27 Jul 2023 21:51:51 +0200
From:   Carsten =?UTF-8?B?U3BpZcOf?= <mail@carsten-spiess.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Message-ID: <20230727215057.1976357b.mail@carsten-spiess.de>
In-Reply-To: <20230727194813.2245116-1-mail@carsten-spiess.de>
References: <20230727194813.2245116-1-mail@carsten-spiess.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XKNlUmE4NO9fEZx=YSRnzkv";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-bounce-key: webpack.hosteurope.de;mail@carsten-spiess.de;1690487520;d5034fd6;
X-HE-SMSGID: 1qP71i-00027Z-TD
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--Sig_/XKNlUmE4NO9fEZx=YSRnzkv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

sorry, forgot to add the v2 to [Patch ], resending it again.

Regards, Carsten

--Sig_/XKNlUmE4NO9fEZx=YSRnzkv
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEWM+MlUpz/bWsZllTM1JQzV9LKSwFAmTCytcACgkQM1JQzV9L
KSxw2w//aM0dtPqEgjaI93tE5N8uOrFbZhvLXt9gpUHYUrsQa3xArbvsXy1tSrp7
xIUVvCjiYnRE/NduBDYAWZgZXDu3Lo+/UIQQPqwWCf0b3xTTnZvngBTKrB3j9TUQ
sBNBTCxsOD2XJynQ3GnMlB80gZKQTaTiiY7dHqhcsC5VHoy6r4//pCOcxcvfBt/1
+oPXDpt05kCaHuxyZdHEE8w/qkTLSbKFE2nAUp0Zf8w+WnMVVHfwixhLxUVOz7La
+P9Ls2+KHLtcejeLlM8hRTe1dgiLQlWj+vfQvRM4du3gB11HF8ES5H1svPPHRA2/
UPLOL9l26kpZQKd23Gt5Z1AeonrV1LMxEuIcFO9J0JC7oXbV3ntqS7ohL6wHRrhO
/a2+cwOx3Jqw6CcU93eec+MA1P1l3pc4E4KdE0N3JYHVxx+tnvh5FEx/ubS61C/0
trn3Wr0wOoLBEiHF1972ddrus+QpjguXbmyHwGnjEnNXebshSskPEq08pW1z+RY0
2yXTCUMaKK7fQMeApiuVmjigUCSlLyNjghEvjq7KQK01FpgbvmN2Xs/RuaEZqq6V
/L8qr/1VLMdij9WPw3Vmanu/B+pVlQ/NO1VmqwnDQZbXxppi10AUFjuEG/Uk5WvC
fgCmFrZMpTSr7HpfYXPNXSV853hRnn4QOmiEoyElmpsq+oOTQec=
=JK9S
-----END PGP SIGNATURE-----

--Sig_/XKNlUmE4NO9fEZx=YSRnzkv--
