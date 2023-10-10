Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1C87C42BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 23:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344118AbjJJVjv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Oct 2023 17:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343946AbjJJVju (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 17:39:50 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076169D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 14:39:49 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-41b2bf4e9edso2660001cf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 14:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1696973988; x=1697578788; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kiW95JpAAA0bRXv2UI8r9acdmO7Ajxh1U2X+TWD3FMs=;
        b=HU0gkVp7eQ0b1sC7at0lnzBbgpo/fjQbDRTORtWvwRg1zNO3PIRs97u2nzz8clF1z4
         dzf6Q2SZKZvoVVSWXffFxNIHIMerNQA3BZAYMKQGNNbMGZDUcDb52jkrBrB/6EfQTvYv
         r+CQvt4YpPPoi9xlpMyGDtN7XFPJL8Q/6xOd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696973988; x=1697578788;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kiW95JpAAA0bRXv2UI8r9acdmO7Ajxh1U2X+TWD3FMs=;
        b=K5At4BvVsRLnzwo0waq5BJI/Cn2aFOZhvqF9jNTLj9M7JyVfu4VIIZKex+wQWCu2/5
         RhVLWJ9CCzsrCl/0ZXUwih5vZwJprBYV+Gpe6QVDgUuyTaUKBnEJe9UjJ6qvWCaNGyjQ
         udbaDVdVqn1HczV51EXDG6S/4oG5cIU6NoVwx/v9bZ5G0vVMWL/rt4SeqQ+5VHc1QXyX
         HEXfLofMrYWEjIAok40dX08vGLpJLq3mmaswom3H0iqzUMRufOSDx59OKx+oisGhyvMc
         kbWftTQv6Y71CZlHY/kW0SwfC8mYRSSMAH0SodGRvSEDLl1vnZ9k2IVLRQ2VinwatVLT
         B3rw==
X-Gm-Message-State: AOJu0YwTVZhC2UNwC084ANEfiGiodLkwCjOKxqrUiavuc7apb3OeKNFd
        vTZHRwSxKTE3hWUVOnhOI0zActVIa5Eo3FcacCU=
X-Google-Smtp-Source: AGHT+IGsKV075x99LP82wEXfoCU9G0DMUXJOol2hhdUduMGdrSdgI4Jjef7JIEzPkb6LIlDbEsn+Cg==
X-Received: by 2002:a05:622a:1314:b0:417:f666:b780 with SMTP id v20-20020a05622a131400b00417f666b780mr22357478qtk.19.1696973988085;
        Tue, 10 Oct 2023 14:39:48 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bb36-20020a05622a1b2400b00403ad6ec2e8sm4804797qtb.26.2023.10.10.14.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 14:39:47 -0700 (PDT)
From:   Florian Fainelli <florian.fainelli@broadcom.com>
To:     netdev@vger.kernel.org
Cc:     Florian Fainelli <florian.fainelli@broadcom.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH
        DRIVER)
Subject: [PATCH net-next 0/2] Switch DSA to inclusive terminology
Date:   Tue, 10 Oct 2023 14:39:40 -0700
Message-Id: <20231010213942.3633407-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000c548780607638b68"
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MIME_NO_TEXT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--000000000000c548780607638b68
Content-Transfer-Encoding: 8bit

One of the action items following Netconf'23 is to switch subsystems to
use inclusive terminology. DSA has been making extensive use of the
"master" and "slave" words which are now replaced by "conduit" and
"user" respectively.

Florian Fainelli (2):
  net: dsa: Use conduit and user terms
  net: dsa: Rename IFLA_DSA_MASTER to IFLA_DSA_CONDUIT

 .../bindings/net/dsa/mediatek,mt7530.yaml     |    2 +-
 Documentation/networking/dsa/b53.rst          |   14 +-
 Documentation/networking/dsa/bcm_sf2.rst      |    2 +-
 .../networking/dsa/configuration.rst          |  106 +-
 Documentation/networking/dsa/dsa.rst          |  150 +-
 Documentation/networking/dsa/lan9303.rst      |    2 +-
 Documentation/networking/dsa/sja1105.rst      |    8 +-
 .../dts/marvell/armada-3720-espressobin.dtsi  |    2 +-
 drivers/net/dsa/b53/b53_common.c              |    4 +-
 drivers/net/dsa/b53/b53_mdio.c                |    2 +-
 drivers/net/dsa/bcm_sf2.c                     |   36 +-
 drivers/net/dsa/bcm_sf2.h                     |    2 +-
 drivers/net/dsa/bcm_sf2_cfp.c                 |    4 +-
 drivers/net/dsa/lan9303-core.c                |    4 +-
 drivers/net/dsa/lantiq_gswip.c                |   34 +-
 drivers/net/dsa/microchip/ksz9477.c           |    6 +-
 drivers/net/dsa/microchip/ksz_common.c        |   20 +-
 drivers/net/dsa/microchip/ksz_ptp.c           |    2 +-
 drivers/net/dsa/mt7530.c                      |   16 +-
 drivers/net/dsa/mv88e6xxx/chip.c              |    2 +-
 drivers/net/dsa/ocelot/felix.c                |   62 +-
 drivers/net/dsa/ocelot/felix.h                |    4 +-
 drivers/net/dsa/qca/qca8k-8xxx.c              |   48 +-
 drivers/net/dsa/qca/qca8k-common.c            |    2 +-
 drivers/net/dsa/qca/qca8k-leds.c              |    6 +-
 drivers/net/dsa/qca/qca8k.h                   |    2 +-
 drivers/net/dsa/realtek/realtek-smi.c         |   28 +-
 drivers/net/dsa/realtek/realtek.h             |    2 +-
 drivers/net/dsa/sja1105/sja1105_main.c        |    4 +-
 drivers/net/dsa/xrs700x/xrs700x.c             |   12 +-
 drivers/net/ethernet/broadcom/bcmsysport.c    |    2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |    2 +-
 include/linux/dsa/sja1105.h                   |    2 +-
 include/net/dsa.h                             |   54 +-
 include/net/dsa_stubs.h                       |   10 +-
 include/uapi/linux/if_link.h                  |    3 +-
 net/core/dev_ioctl.c                          |    2 +-
 net/dsa/Makefile                              |    4 +-
 net/dsa/{master.c => conduit.c}               |   96 +-
 net/dsa/conduit.h                             |   22 +
 net/dsa/dsa.c                                 |  218 +--
 net/dsa/dsa.h                                 |   10 +-
 net/dsa/master.h                              |   22 -
 net/dsa/netlink.c                             |   22 +-
 net/dsa/port.c                                |  114 +-
 net/dsa/port.h                                |    2 +-
 net/dsa/slave.h                               |   69 -
 net/dsa/switch.c                              |   18 +-
 net/dsa/switch.h                              |    4 +-
 net/dsa/tag.c                                 |   10 +-
 net/dsa/tag.h                                 |   26 +-
 net/dsa/tag_8021q.c                           |   22 +-
 net/dsa/tag_8021q.h                           |    2 +-
 net/dsa/tag_ar9331.c                          |    4 +-
 net/dsa/tag_brcm.c                            |   14 +-
 net/dsa/tag_dsa.c                             |    6 +-
 net/dsa/tag_gswip.c                           |    4 +-
 net/dsa/tag_hellcreek.c                       |    4 +-
 net/dsa/tag_ksz.c                             |   12 +-
 net/dsa/tag_lan9303.c                         |    4 +-
 net/dsa/tag_mtk.c                             |    4 +-
 net/dsa/tag_none.c                            |    4 +-
 net/dsa/tag_ocelot.c                          |   22 +-
 net/dsa/tag_ocelot_8021q.c                    |   12 +-
 net/dsa/tag_qca.c                             |    6 +-
 net/dsa/tag_rtl4_a.c                          |    6 +-
 net/dsa/tag_rtl8_4.c                          |    6 +-
 net/dsa/tag_rzn1_a5psw.c                      |    4 +-
 net/dsa/tag_sja1105.c                         |   30 +-
 net/dsa/tag_trailer.c                         |    4 +-
 net/dsa/tag_xrs700x.c                         |    4 +-
 net/dsa/{slave.c => user.c}                   | 1240 ++++++++---------
 net/dsa/user.h                                |   69 +
 73 files changed, 1392 insertions(+), 1391 deletions(-)
 rename net/dsa/{master.c => conduit.c} (79%)
 create mode 100644 net/dsa/conduit.h
 delete mode 100644 net/dsa/master.h
 delete mode 100644 net/dsa/slave.h
 rename net/dsa/{slave.c => user.c} (67%)
 create mode 100644 net/dsa/user.h

-- 
2.34.1


--000000000000c548780607638b68
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVgwggRAoAMCAQICDBP8P9hKRVySg3Qv5DANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjE4MTFaFw0yNTA5MTAxMjE4MTFaMIGW
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEZsb3JpYW4gRmFpbmVsbGkxLDAqBgkqhkiG
9w0BCQEWHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA+oi3jMmHltY4LMUy8Up5+1zjd1iSgUBXhwCJLj1GJQF+GwP8InemBbk5rjlC
UwbQDeIlOfb8xGqHoQFGSW8p9V1XUw+cthISLkycex0AJ09ufePshLZygRLREU0H4ecNPMejxCte
KdtB4COST4uhBkUCo9BSy1gkl8DJ8j/BQ1KNUx6oYe0CntRag+EnHv9TM9BeXBBLfmMRnWNhvOSk
nSmRX0J3d9/G2A3FIC6WY2XnLW7eAZCQPa1Tz3n2B5BGOxwqhwKLGLNu2SRCPHwOdD6e0drURF7/
Vax85/EqkVnFNlfxtZhS0ugx5gn2pta7bTdBm1IG4TX+A3B1G57rVwIDAQABo4IB3jCCAdowDgYD
VR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEG
CCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWdu
MmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6
hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNy
bDAoBgNVHREEITAfgR1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUUwwfJ6/F
KL0fRdVROal/Lp4lAF0wDQYJKoZIhvcNAQELBQADggEBAKBgfteDc1mChZjKBY4xAplC6uXGyBrZ
kNGap1mHJ+JngGzZCz+dDiHRQKGpXLxkHX0BvEDZLW6LGOJ83ImrW38YMOo3ZYnCYNHA9qDOakiw
2s1RH00JOkO5SkYdwCHj4DB9B7KEnLatJtD8MBorvt+QxTuSh4ze96Jz3kEIoHMvwGFkgObWblsc
3/YcLBmCgaWpZ3Ksev1vJPr5n8riG3/N4on8gO5qinmmr9Y7vGeuf5dmZrYMbnb+yCBalkUmZQwY
NxADYvcRBA0ySL6sZpj8BIIhWiXiuusuBmt2Mak2eEv0xDbovE6Z6hYyl/ZnRadbgK/ClgbY3w+O
AfUXEZ0xggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwT
/D/YSkVckoN0L+QwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIIX1jABTr3R5SEbR
CLKPZ1YLAYC3ssmzsz1k0KQARd/EMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTIzMTAxMDIxMzk0OFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCNeTht2AbkIOreE29G83d2gOVH0eSWKD7E
DqGmUkpc2YLfZJWr79LrZNZ7zpxCthK3M8A1JucBM9Kb+47es3nFdWMgUiANM4ZjMEVjeyXSW91Z
hv2Tw5QyLDfzE9p56F7PxtKgi8vek/RNtBsxT3YLdLlM61MTT3tc9Q4bVBjYbzJrEpng0jAREgpv
RQCrh33x0INGCoNVt7bA5KGJO6g7lYU+17lFxiDxFH6A4szwy+SIKBY+nPgUBF5kJ9O8RnnF0N6R
IClJhtr5Z4y2AfeARKK+92Xm7/GwLSzwnZzVqSlrfeFn0gmSmsTH37DZrAqx+tl5otlqxeox4N7A
CLny
--000000000000c548780607638b68--
